defmodule Waves.Repo.Migrations.CreateForecasts do
  use Ecto.Migration

  def change do
    create table(:forecasts) do
      add :spot_id, references(:spots)
      add :datetimes, {:array, :utc_datetime}
      add :wind_speed, {:array, :integer}
      add :wind_gust, {:array, :integer}
      add :wind_direction, {:array, :integer}
      add :wave_height, {:array, :float}
      add :wave_period, {:array, :integer}
      add :wave_direction, {:array, :integer}
      add :temperature, {:array, :integer}

      timestamps()
    end

  end
end
