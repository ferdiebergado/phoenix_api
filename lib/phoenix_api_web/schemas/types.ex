defmodule PhoenixApiWeb.Schemas.Types do
  use Absinthe.Schema.Notation

  alias PhoenixApiWeb.Schemas.Types

  import_types(Types.UserType)
end
