defmodule PhoenixApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :password_hash, :string
      add :last_login, :utc_datetime
      add :role, :integer

      timestamps()
    end

    create(unique_index(:users, [:email]))
  end
end
