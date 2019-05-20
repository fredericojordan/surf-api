defmodule WavesWeb.PageController do
  use WavesWeb, :controller

  import Ecto.Query

  alias Waves.{Repo, SpotForecast}

  def index(conn, _params) do
    forecast =
      SpotForecast
      |> first
      |> Repo.one()

    wave_height = [
      %{
        "name":  "Wave Height",
        "data": Map.new(List.zip([forecast.datetimes, forecast.wave_height]))
      },
    ]

    wind_data = [
      %{
        "name":  "Wind Speed",
        "data": Map.new(List.zip([forecast.datetimes, forecast.wind_speed]))
      },
      %{
        "name":  "Wind Gusts",
        "data": Map.new(List.zip([forecast.datetimes, forecast.wind_gust]))
      },
    ]

    conn
    |> assign(:wave_height, wave_height)
    |> assign(:wind_data, wind_data)
    |> render("index.html")
  end
end