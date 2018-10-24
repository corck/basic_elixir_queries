defmodule BasicQueries.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:username, :string, unique: true)
      add(:email, :string)
    end
  end
end
