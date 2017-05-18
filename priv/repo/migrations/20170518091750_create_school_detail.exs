defmodule SchoolDiary.Repo.Migrations.CreateSchoolDetail do
  use Ecto.Migration

  def change do
    create table(:school_details, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :code, :string
      add :address, :string
      add :contact_number_1, :string
      add :contact_number_2, :string
      add :contact_email, :string
      add :primary_color, :string
      add :licence_start_date, :date
      add :licence_end_date, :date
      add :licence_type, :string
      add :licence_attributes, :map

      timestamps()
    end

  end
end
