defmodule WavesWeb.PageController do
  use WavesWeb, :controller

  import Ecto.Query

  alias Waves.{Repo, SpotForecast}

  defp pad(number), do: String.pad_leading("#{number}", 2, "0")

  def index(conn, params) do
    forecast =
      SpotForecast
      |> last
      |> Repo.one
      |> Repo.preload(spot: :forecasts)

    index(conn, params, forecast)
  end

  defp index(conn, _params, nil), do: empty_index(conn)

  defp index(conn, _params, forecast) do
    wave_height =
      [
        %{
          name: "Wave Height",
          data: Map.new(List.zip([forecast.datetimes, forecast.wave_height]))
        },
      ]

    wind_data =
      [
        %{
          name: "Wind Speed",
          data: Map.new(List.zip([forecast.datetimes, forecast.wind_speed]))
        },
        %{
          name: "Wind Gusts",
          data: Map.new(List.zip([forecast.datetimes, forecast.wind_gust]))
        },
      ]

    spot_name = forecast.spot.name

    d = forecast.inserted_at
    forecast_date = "#{d.year}-#{pad(d.month)}-#{pad(d.day)}"
    forecast_time = "#{pad(d.hour)}:#{pad(d.minute)}"

    conn
    |> assign(:wave_height, wave_height)
    |> assign(:wind_data, wind_data)
    |> assign(:spot_name, spot_name)
    |> assign(:forecast_date, forecast_date)
    |> assign(:forecast_time, forecast_time)
    |> render("index.html")
  end

  def empty_index(conn) do
    conn
    |> assign(:wave_height, [])
    |> assign(:wind_data, [])
    |> assign(:spot_name, "")
    |> assign(:forecast_date, "")
    |> assign(:forecast_time, "")
    |> render("index.html")
  end
end