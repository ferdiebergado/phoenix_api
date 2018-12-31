defmodule PhoenixApi.AccountTest do
  use PhoenixApi.DataCase

  alias PhoenixApi.Account

  describe "users" do
    alias PhoenixApi.Account.User

    @valid_attrs %{email: "some email", last_login: ~N[2010-04-17 14:00:00], password: "some password", role: 42}
    @update_attrs %{email: "some updated email", last_login: ~N[2011-05-18 15:01:01], password: "some updated password", role: 43}
    @invalid_attrs %{email: nil, last_login: nil, password: nil, role: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Account.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.last_login == ~N[2010-04-17 14:00:00]
      assert user.password == "some password"
      assert user.role == 42
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Account.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.last_login == ~N[2011-05-18 15:01:01]
      assert user.password == "some updated password"
      assert user.role == 43
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end
end
