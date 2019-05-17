defmodule Waves.SpotForecast do
  use Ecto.Schema
  import Ecto.Changeset

  schema "forecasts" do
    field :datetimes, {:array, :utc_datetime}
    field :temperature, {:array, :integer}
    field :wave_direction, {:array, :integer}
    field :wave_height, {:array, :float}
    field :wave_period, {:array, :integer}
    field :wind_direction, {:array, :integer}
    field :wind_gust, {:array, :integer}
    field :wind_speed, {:array, :integer}
    belongs_to :spot, Waves.Spot

    timestamps()
  end

  @doc false
  def changeset(spot_forecast, attrs) do
    spot_forecast
    |> cast(attrs, [:datetimes, :wind_speed, :wind_gust, :wind_direction, :wave_height, :wave_period, :wave_direction, :temperature])
#    |> validate_required([:datetimes, :wind_speed, :wind_gust, :wind_direction, :wave_height, :wave_period, :wave_direction, :temperature])
  end
end
