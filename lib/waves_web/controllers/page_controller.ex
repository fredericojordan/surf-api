defmodule WavesWeb.PageController do
  use WavesWeb, :controller

  import Ecto.Query

  alias Waves.{Repo, SpotForecast}

  defp pad(number), do: String.pad_leading("#{number}", 2, "0")

  def index(conn, _params) do
    forecast =
      SpotForecast
      |> last
      |> Repo.one
      |> Repo.preload(spot: :forecasts)

    wave_height =
      case forecast do
        nil -> []
        _ ->
          [
            %{
              name: "Wave Height",
              data: Map.new(List.zip([forecast.datetimes, forecast.wave_height]))
            },
          ]
      end

    wind_data =
      case forecast do
        nil -> []
        _ ->
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
      end

    spot_name =
      case forecast do
        nil -> "Error"
        _ -> forecast.spot.name
      end

    d = forecast.inserted_at

    conn
    |> assign(:wave_height, wave_height)
    |> assign(:wind_data, wind_data)
    |> assign(:spot_name, spot_name)
    |> assign(:forecast_date, "#{d.year}-#{pad(d.month)}-#{pad(d.day)}")
    |> assign(:forecast_time, "#{pad(d.hour)}:#{pad(d.minute)}")
    |> render("index.html")
  end
end