defmodule PhoenixApiWeb.Schema do
  use Absinthe.Schema

  alias PhoenixApiWeb.Resolvers

  import_types(PhoenixApiWeb.Schemas.Types)

  query do
    @desc "Get all users"
    field :users, list_of(:user_type) do
      resolve(&Resolvers.UserResolver.users/3)
    end
  end
end
