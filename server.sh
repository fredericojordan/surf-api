# Initial setup
mix deps.get --only prod
mix compile

# Compile assets
cd assets && webpack --mode production && cd ..
mix phx.digest

# Custom tasks (like DB migrations)
mix ecto.migrate

# Finally run the server
mix phx.server