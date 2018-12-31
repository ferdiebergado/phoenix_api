defmodule PhoenixApiWeb.Router do
  use PhoenixApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward("/graphql", Absinthe.Plug, schema: PhoenixApiWeb.Schema, interface: :simple)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL,
        schema: PhoenixApiWeb.Schema,
        # interface: :simple,
        json_codec: Jason
      )
    end
  end
end
