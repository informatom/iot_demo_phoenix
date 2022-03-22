import Config

config :weather_tracker,
  ecto_repos: [WeatherTracker.Repo],
  generators: [binary_id: true]

config :weather_tracker, WeatherTrackerWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: WeatherTrackerWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: WeatherTracker.PubSub,
  live_view: [signing_salt: "Fsg8to5A"]

config :esbuild,
  version: "0.14.0",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
