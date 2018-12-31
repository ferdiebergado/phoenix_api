defmodule PhoenixApiWeb.Resolvers.UserResolver do
  alias PhoenixApi.Account

  def users(_, _, _) do
    {:ok, Account.list_users()}
  end
end
