defmodule Waves.Repo.Migrations.CreateSpots do
  use Ecto.Migration

  def change do
    create table(:spots) do
      add :name, :string
      add :spot_id, :integer

      timestamps()
    end

  end
end
