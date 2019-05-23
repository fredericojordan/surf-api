defmodule WavesWeb.SpotsView do
  use WavesWeb, :view

  def render("spots.json", %{spots: spots}) do
    %{
      spots: Enum.map(spots, &spot_json/1)
    }
  end

  def render("spot_forecasts.json", %{spot_forecasts: spot_forecasts}) do
    %{
      spot_forecasts: Enum.map(spot_forecasts, &spot_forecast_json/1)
    }
  end

  def spot_json(spot) do
    %{
      id: spot.id,
      name: spot.name,
      windguru_id: spot.windguru_id,
      inserted_at: spot.inserted_at,
      updated_at: spot.updated_at,
    }
  end

  def spot_forecast_json(spot_forecast) do
    %{
      id: spot_forecast.id,
      spot_id: spot_forecast.spot_id,
      datetimes: spot_forecast.datetimes,
      wind_speed: spot_forecast.wind_speed,
      wind_gust: spot_forecast.wind_gust,
      wind_direction: spot_forecast.wind_direction,
      wave_height: spot_forecast.wave_height,
      wave_period: spot_forecast.wave_period,
      wave_direction: spot_forecast.wave_direction,
      temperature: spot_forecast.temperature,
      inserted_at: spot_forecast.inserted_at,
      updated_at: spot_forecast.updated_at,
    }
  end
end
