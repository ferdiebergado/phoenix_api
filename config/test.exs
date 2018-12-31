use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_api, PhoenixApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phoenix_api, PhoenixApi.Repo,
  username: "postgres",
  password: "postgres",
  database: "phoenix_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Password Hashing
config :argon2_elixir, t_cost: 2, m_cost: 8
config :bcrypt_elixir, log_rounds: 4
config :pbkdf2_elixir, rounds: 1
