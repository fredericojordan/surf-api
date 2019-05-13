defmodule Waves.Spot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "spots" do
    field :name, :string
    field :spot_id, :integer

    timestamps()
  end

  @doc false
  def changeset(spot, attrs) do
    spot
    |> cast(attrs, [:name, :spot_id])
    |> validate_required([:name])
    |> validate_length(:name, min: 2)
  end
end
