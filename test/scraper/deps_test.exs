Application.start :hound
Application.ensure_all_started(:hound)
ExUnit.start()

defmodule DependenciesTest do
  use ExUnit.Case
  use Hound.Helpers

  test "HTTPoison_test", _meta do
    {success_code, response} = HTTPoison.get("https://www.windguru.cz/105160")

    assert success_code == :ok
    assert response.status_code == 200
  end

  test "Hound_test", _meta do
    Hound.start_session

    navigate_to("https://www.windguru.cz/105160")

    wave_heights =
      find_element(:id, "div_wgfcst0")
      |> find_within_element(:id, "tabid_0_0_HTSGW")
      |> find_all_within_element(:tag, "td")
      |> Enum.map(&visible_text/1)

    assert Enum.count(wave_heights) > 0

    Hound.end_session
  end

end