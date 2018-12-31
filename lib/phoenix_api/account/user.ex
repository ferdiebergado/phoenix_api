defmodule PhoenixApi.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string, unique: true
    field :last_login, :naive_datetime
    field :password, :string
    field :role, :integer, default: 1

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :last_login, :role])
    |> validate_required([:email, :password, :last_login, :role])
    |> validate_format(:email, ~r/@/)
    |> update_change(:email, &String.downcase(&1))
  end
end
