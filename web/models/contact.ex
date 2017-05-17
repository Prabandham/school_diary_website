defmodule SchoolDiary.Contact do
  use SchoolDiary.Web, :model

  schema "contact_requests" do
    field :name, :string
    field :email, :string
    field :message, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :message])
    |> validate_required([:name, :email, :message])
    |> validate_format(:email, ~r/@/)
    |> validate_format(:name, ~r/a-z/)
  end
end
