defmodule WavesWeb.SpotsController do
  use WavesWeb, :controller

  import Ecto.Query

  alias Waves.{Repo, Spot, SpotForecast}

  def spots(conn, _params) do
    spots = Repo.all(Spot)
    render conn, "spots.json", spots: spots
  end

  def spot_forecasts(conn, params) do
    spot_id = String.to_integer(params["spot_id"])
    spot_forecasts = Repo.all(from s in SpotForecast, where: s.spot_id == ^spot_id)
    render conn, "spot_forecasts.json", spot_forecasts: spot_forecasts
  end
end
