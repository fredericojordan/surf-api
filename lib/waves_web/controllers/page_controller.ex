defmodule WavesWeb.PageController do
  use WavesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
