defmodule WavesWeb.SpotsControllerTest do
  use WavesWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    body = json_response(conn, 200)
    assert Enum.member?(Map.keys(body), "spots")
  end
end
