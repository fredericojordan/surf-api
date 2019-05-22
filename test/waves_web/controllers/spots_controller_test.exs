defmodule WavesWeb.SpotsControllerTest do
  use WavesWeb.ConnCase

  test "GET /api", %{conn: conn} do
    conn = get(conn, "/api")
    body = json_response(conn, 200)
    assert Enum.member?(Map.keys(body), "spots")
  end
end
