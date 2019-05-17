defmodule WavesWeb.SpotsView do
  use WavesWeb, :view

  def render("spots.json", %{spots: spots}) do
    %{
      spots: Enum.map(spots, &spot_json/1)
    }
  end

  def spot_json(spot) do
    %{
      name: spot.name,
      spot_id: spot.spot_id,
      inserted_at: spot.inserted_at,
      updated_at: spot.updated_at
    }
  end
end
