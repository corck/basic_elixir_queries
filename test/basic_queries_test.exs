defmodule BasicQueriesTest do
  use ExUnit.Case
  import BasicQueries.Repo
  import Ecto.Query, only: [from: 2]

  alias BasicQueries.User
  alias BasicQueries.Repo

  setup do
    Repo.delete_all(User)
    :ok
  end

  def user_attributes do
    %{username: "max", email: "max@headroom.com"}
  end

  def username do
    Map.get(user_attributes(), :username)
  end

  def create_user do
    {:ok, user} = %User{}
                  |> User.changeset(user_attributes())
                  |> Repo.insert
    user
  end

  test "create user" do
    user = create_user()
    assert user.username == username()
  end

  test "query user" do
    u = create_user()

    query =
      from(
        u in User,
        where: u.username == "max",
        select: u.username
      )

    name = Repo.one(query)
    name == username()
  end
end
