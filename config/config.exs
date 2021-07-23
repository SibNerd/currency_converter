# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :converter,
  ecto_repos: [Converter.Repo]

# Configures the endpoint
config :converter, ConverterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VAbcgpIFGsRz3VWI7vFgZ7M/ceRJANQrddpdT+ZU+5iJJHi8IsliK20OP7Eso/4n",
  render_errors: [view: ConverterWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Converter.PubSub,
  live_view: [signing_salt: "8vYp59IT"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
