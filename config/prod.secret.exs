use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :waves, WavesWeb.Endpoint,
  secret_key_base: "4mdYCQHI7GbPSFuAU2/S8ZP6t7BgwunQoTXhcuyort+hei1p0v/X7FdIhVC3XI40"

# Configure your database
config :waves, Waves.Repo,
  username: "postgres",
  password: "postgres",
  database: "waves_prod",
  pool_size: 15
