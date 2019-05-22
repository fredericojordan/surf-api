defmodule Waves.Spot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "spots" do
    field :name, :string
    field :windguru_id, :integer
    has_many :forecasts, Waves.SpotForecast

    timestamps()
  end

  @doc false
  def changeset(spot, attrs) do
    spot
    |> cast(attrs, [:name, :windguru_id])
    |> validate_required([:name])
    |> validate_length(:name, min: 2)
  end
end
