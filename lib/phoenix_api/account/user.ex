defmodule PhoenixApi.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string, unique: true
    field :last_login, :naive_datetime
    field :password, :string
    field :password_hash, :string
    field :role, :integer, default: 1

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :last_login, :role])
    |> validate_required([:email, :password])
    |> validate_format(:email, ~r/@/)
    |> update_change(:email, &String.downcase(&1))
    |> validate_length(:password, min: 8, max: 100)
    |> unique_constraint(:email)
    |> hash_password
  end

  defp hash_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Comeonin.Argon2.add_hash(password))
  end

  defp hash_password(changeset) do
    changeset
  end
end
