defmodule WindguruScraper do
  @moduledoc """
  Windguru module extracts data from Windguru.
  """

  use Hound.Helpers

  @default_spot_id 105160

  defp fetch_data_element(spot_id) do
    navigate_to("https://www.windguru.cz/#{spot_id}")

    find_element(:id, "div_wgfcst0")
  end

  defp parse_int(number) do
    case Integer.parse(number) do
      {number, _rest} -> number
      _ -> nil
    end
  end

  defp parse_float(number) do
    case Float.parse(number) do
     {number, _rest} -> number
      _ -> nil
    end
  end

  defp parse_row_int(data_element, tab_id), do: Enum.map(parse_row(data_element, tab_id), &parse_int/1)

  defp parse_row_float(data_element, tab_id), do: Enum.map(parse_row(data_element, tab_id), &parse_float/1)

  defp parse_row(data_element, tab_id) do
    data_element
    |> find_within_element(:id, tab_id)
    |> find_all_within_element(:tag, "td")
    |> Enum.map(&visible_text/1)
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
      "dates"          => parse_row(data_element, "tabid_0_0_dates"),        # ["Th\n02.\n15h", ...]

      "wind_speed"     => parse_row_int(data_element, "tabid_0_0_WINDSPD"),  # knots
      "wind_gust"      => parse_row_int(data_element, "tabid_0_0_GUST"),     # knots
      "wind_direction" => parse_direction(data_element, "tabid_0_0_SMER"),   # degrees (from north, clockwise)

      "wave_height"    => parse_row_float(data_element, "tabid_0_0_HTSGW"),  # meters
      "wave_period"    => parse_row_int(data_element, "tabid_0_0_PERPW"),    # seconds
      "wave_direction" => parse_direction(data_element, "tabid_0_0_DIRPW"),  # degrees (from north, clockwise)

      "temperature"    => parse_row_int(data_element, "tabid_0_0_TMPE"),     # degrees Celsius
    }
  end

  def fetch_data(), do: fetch_data(@default_spot_id)

  def fetch_data(spot_id) do
    Hound.start_session

    data =
      fetch_data_element(spot_id)
      |> parse_data()

    Hound.end_session

    data
  end

end