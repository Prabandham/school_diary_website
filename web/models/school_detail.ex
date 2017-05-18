defmodule SchoolDiary.SchoolDetail do
  use SchoolDiary.Web, :model

  schema "school_details" do
    field :name, :string
    field :code, :string
    field :address, :string
    field :contact_number_1, :string
    field :contact_number_2, :string
    field :contact_email, :string
    field :primary_color, :string
    field :licence_start_date, Ecto.Date
    field :licence_end_date, Ecto.Date
    field :licence_type, :string
    field :licence_attributes, :map

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :code, :address, :contact_number_1, :contact_number_2, :contact_email, :primary_color, :licence_start_date, :licence_end_date, :licence_type, :licence_attributes])
    |> validate_required([:name, :code, :address, :contact_number_1, :contact_number_2, :contact_email, :primary_color, :licence_start_date, :licence_end_date, :licence_type, :licence_attributes])
  end

  def validate_account_chagenset(struct, params \\ %{}) do
    struct
    |> cast(params, [:code])
    |> validate_required([:code])
  end
end
