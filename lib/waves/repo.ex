defmodule Waves.Repo do
  use Ecto.Repo,
    otp_app: :waves,
    adapter: Ecto.Adapters.Postgres
end
