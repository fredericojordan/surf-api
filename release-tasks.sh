# Initial setup
mix deps.get --only prod
mix compile

# Custom tasks (like DB migrations)
mix ecto.migrate