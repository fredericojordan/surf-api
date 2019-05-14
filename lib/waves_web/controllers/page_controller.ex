defmodule WavesWeb.PageController do
  use WavesWeb, :controller

  alias Waves.{Repo, Spot}

  def index(conn, _params) do
    spots = Repo.all(Spot)
    render conn, "index.json", spots: spots
  end
end
