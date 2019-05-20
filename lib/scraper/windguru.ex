defmodule WindguruScraper do
  @moduledoc """
  Windguru module extracts data from Windguru.
  """

  use Hound.Helpers

  alias Waves.{Repo, Spot, SpotForecast}

  @default_windguru_id 105160

  defp fetch_data_element(windguru_id) do
    navigate_to("https://www.windguru.cz/#{windguru_id}")

    find_element(:id, "div_wgfcst0")
  end

  defp parse_int(number_str) do
    case Integer.parse(number_str) do
      {number, _rest} -> number
      _ -> nil
    end
  end

  defp lstrip([""|rest]), do: lstrip(rest)
  defp lstrip(anything), do: anything

  defp rstrip(list) when is_list(list) do
    list
    |> Enum.reverse()
    |> lstrip()
    |> Enum.reverse()
  end

  defp rstrip(anything), do: anything

  defp parse_float(number_str) do
    case Float.parse(number_str) do
     {number, _rest} -> number
      _ -> nil
    end
  end

  defp parse_row_int(data_element, tab_id), do: Enum.map(parse_row(data_element, tab_id), &parse_int/1)

  defp parse_row_float(data_element, tab_id), do: Enum.map(parse_row(data_element, tab_id), &parse_float/1)

  def parse_month(wg_day, now_day, now_month) when wg_day < 10 and now_day > 20 do
    case now_month do
        12 -> "01"
        _ -> String.pad_leading("#{now_month+1}", 2, "0")
    end
  end

  def parse_month(_wg_day, _now_day, now_month), do: String.pad_leading("#{now_month}", 2, "0")

  defp parse_datetime(
         <<_wg_weekday::bytes-size(2)>> <>
         "\n" <>
         <<wg_day::bytes-size(2)>> <>
         ".\n" <>
         <<wg_hour::bytes-size(2)>> <>
         "h"
       ) do

    now = DateTime.utc_now()
    month = parse_month(String.to_integer(wg_day), now.day(), now.month())
    str = "#{now.year()}-#{month}-#{wg_day}T#{wg_hour}:00:00-03:00"

    case DateTime.from_iso8601(str) do
      {:ok, datetime, _offset} -> datetime
      _ -> nil
    end
  end

  defp parse_datetime(_), do: nil

  defp parse_row_datetimes(data_element, tab_id) do
    parse_row(data_element, tab_id)
    |> Enum.map(&parse_datetime/1)
  end

  defp parse_row(data_element, tab_id) do
    data_element
    |> find_within_element(:id, tab_id)
    |> find_all_within_element(:tag, "td")
    |> Enum.map(&visible_text/1)
    |> rstrip()
  end

  defp parse_direction(data_element, tab_id) do
    data_element
    |> find_within_element(:id, tab_id)
    |> find_all_within_element(:tag, "g")
    |> Enum.map(&(attribute_value(&1, "transform")))
    |> Enum.map(&(String.split(&1, ",")))
    |> Enum.map(&List.first/1)
    |> Enum.map(&(String.split(&1, "(")))
    |> Enum.map(&List.last/1)
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&(rem(&1, 360)))
  end

  defp parse_data(data_element) do
    %{
      "datetimes"      => parse_row_datetimes(data_element, "tabid_0_0_dates"),  # [#DateTime<>, #DateTime<>, ...]

      "wind_speed"     => parse_row_int(data_element, "tabid_0_0_WINDSPD"),      # knots
      "wind_gust"      => parse_row_int(data_element, "tabid_0_0_GUST"),         # knots
      "wind_direction" => parse_direction(data_element, "tabid_0_0_SMER"),       # degrees (from north, clockwise)

      "wave_height"    => parse_row_float(data_element, "tabid_0_0_HTSGW"),      # meters
      "wave_period"    => parse_row_int(data_element, "tabid_0_0_PERPW"),        # seconds
      "wave_direction" => parse_direction(data_element, "tabid_0_0_DIRPW"),      # degrees (from north, clockwise)

      "temperature"    => parse_row_int(data_element, "tabid_0_0_TMPE"),         # degrees Celsius
    }
  end

  def fetch_data(), do: fetch_data(@default_windguru_id)

  def fetch_data(windguru_id) do
    Hound.start_session

    data =
      fetch_data_element(windguru_id)
      |> parse_data()

    Hound.end_session

    data
  end

  def scrape(spot) do
    data = fetch_data(spot.windguru_id)

    Repo.insert(%SpotForecast{
      spot_id: spot.id,
      datetimes: data["datetimes"],
      wind_speed: data["wind_speed"],
      wind_gust: data["wind_gust"],
      wind_direction: data["wind_direction"],
      wave_height: data["wave_height"],
      wave_period: data["wave_period"],
      wave_direction: data["wave_direction"],
      temperature: data["temperature"],
    })
  end

  def scrape_all() do
    Repo.all(Spot)
    |> Enum.each(&scrape/1)
  end

end
