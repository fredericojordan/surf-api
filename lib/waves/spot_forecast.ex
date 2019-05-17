defmodule Waves.SpotForecast do
  use Ecto.Schema
  import Ecto.Changeset

  schema "forecasts" do
    belongs_to :spots, Waves.Spot
    field :dates, {:array, :date}
    field :temperature, {:array, :integer}
    field :wave_direction, {:array, :integer}
    field :wave_height, {:array, :float}
    field :wave_period, {:array, :integer}
    field :wind_direction, {:array, :integer}
    field :wind_gust, {:array, :integer}
    field :wind_speed, {:array, :integer}

    timestamps()
  end

  @doc false
  def changeset(spot_forecast, attrs) do
    spot_forecast
    |> cast(attrs, [:dates, :wind_speed, :wind_gust, :wind_direction, :wave_height, :wave_period, :wave_direction, :temperature])
#    |> validate_required([:dates, :wind_speed, :wind_gust, :wind_direction, :wave_height, :wave_period, :wave_direction, :temperature])
  end
end
