defmodule BasicQueriesTest do
  use ExUnit.Case
  doctest BasicQueries
  alias BasicQueries.User
  import BasicQueries.Repo
  alias BasicQueries.Repo

  def user_attributes do
    %{username: "max", email: "max@headroom.com"}
  end

  def create_user do
    {:ok, user} = %User{}
                  |> User.changeset(user_attributes())
                  |> Repo.insert
    user
  end

  test "create user" do
    user = create_user
    assert user.username == Map.get(user_attributes(), :username)
  end
end
