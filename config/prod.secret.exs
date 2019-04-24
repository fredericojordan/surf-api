use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :test, TestWeb.Endpoint,
  secret_key_base: "GnhJHBziBmMpXG7/1Nregad/wBneMDwqDigatt7EhVcESD2IpWaAamXAljr8VJ9i"

# Configure your database
config :test, Test.Repo,
  username: "postgres",
  password: "postgres",
  database: "test_prod",
  pool_size: 15
