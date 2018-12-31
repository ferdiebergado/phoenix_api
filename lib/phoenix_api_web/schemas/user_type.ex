defmodule PhoenixApiWeb.Schemas.Types.UserType do
  use Absinthe.Schema.Notation

  object :user_type do
    field(:id, :id)
    field(:email, :string)
    field(:role, :integer)
  end

  input_object :user_input_type do
    field(:email, non_null(:string))
  end
end
