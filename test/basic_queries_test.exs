defmodule BasicQueriesTest do
  use ExUnit.Case
  doctest BasicQueries
  alias BasicQueries.User
  import BasicQueries.Repo
  alias BasicQueries.Repo

  def user_attributes() do
    %{username: "max", email: "max@headroom.com"}
  end

  test "create user" do
    {:ok, user} = %User{}
    |> User.changeset(user_attributes())
    |> Repo.insert
    assert user.username == Map.get(user_attributes(), :username)
  end
end
