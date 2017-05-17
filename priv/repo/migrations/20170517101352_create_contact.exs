defmodule SchoolDiary.Repo.Migrations.CreateContact do
  use Ecto.Migration

  def change do
    create table(:contact_requests, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :email, :string
      add :message, :text

      timestamps()
    end

  end
end
