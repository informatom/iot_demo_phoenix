import Config

config :weather_tracker, WeatherTracker.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "weather_tracker_dev",
  port: 54320,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :weather_tracker, WeatherTrackerWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "B2lyyYo7TXCmYFhzSYG/oXfEnwIqUBu47pd53IT1HNSHzHqsdjQu5GXzFUPAjYgd",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]}
  ]

config :logger, :console, format: "[$level] $message\n"
config :phoenix, :stacktrace_depth, 20
config :phoenix, :plug_init_mode, :runtime
