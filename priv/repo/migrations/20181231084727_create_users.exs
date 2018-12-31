defmodule PhoenixApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :password, :string
      add :last_login, :naive_datetime
      add :role, :integer

      timestamps()
    end
  end
end
