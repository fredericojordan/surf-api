# Initial setup
mix deps.get --only prod
mix compile

# Compile assets
cd assets
npm install
webpack-cli --mode production
cd ..

mix phx.digest

# Custom tasks (like DB migrations)
mix ecto.migrate