Application.start :hound
Application.ensure_all_started(:hound)
ExUnit.start()

defmodule WindguruScraper do
  use ExUnit.Case
  use Hound.Helpers

  test "HTTPoison_test", _meta do
    case HTTPoison.get("https://www.windguru.cz/105160") do
      {:ok, response} ->
        case response.status_code do
          200 -> :ok
          _ -> :error
        end
      _ -> :error
    end
  end

  test "Hound_test", _meta do
    Hound.start_session

    navigate_to("https://www.windguru.cz/105160")

    wave_heights =
      find_element(:id, "div_wgfcst0")
      |> find_within_element(:id, "tabid_0_0_HTSGW")
      |> find_all_within_element(:tag, "td")
      |> Enum.map(&visible_text/1)
#      |> Enum.map(&Float.parse/1)
#      |> IO.inspect()

    assert Enum.count(wave_heights) > 0

    Hound.end_session
  end

end