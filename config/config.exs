# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :mars_rovers_web, MarsRoversWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kRXYsmwCTrx24+vxzxCDc60gOIoz9DEvvwmqX0kZmhu7jLMQrrgdVirJexvE4PZi",
  render_errors: [view: MarsRoversWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MarsRoversWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :mars_rovers,
  :plateau_size, {1200, 600}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
