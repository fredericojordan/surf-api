ExUnit.start()

defmodule WindguruScraperTest do
  use ExUnit.Case

  test "Fetch_data_test", _meta do
    WindguruScraper.fetch_data()
  end

end