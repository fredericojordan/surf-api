defmodule WavesWeb.SpotsController do
  use WavesWeb, :controller

  alias Waves.{Repo, Spot}

  def spots(conn, _params) do
    spots = Repo.all(Spot)
    render conn, "spots.json", spots: spots
  end
end
