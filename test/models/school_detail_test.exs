defmodule SchoolDiary.SchoolDetailTest do
  use SchoolDiary.ModelCase

  alias SchoolDiary.SchoolDetail

  @valid_attrs %{address: "some content", code: "some content", contact_email: "some content", contact_number_1: "some content", contact_number_2: "some content", licence_attributes: %{}, licence_end_date: %{day: 17, month: 4, year: 2010}, licence_start_date: %{day: 17, month: 4, year: 2010}, licence_type: "some content", name: "some content", primary_color: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SchoolDetail.changeset(%SchoolDetail{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SchoolDetail.changeset(%SchoolDetail{}, @invalid_attrs)
    refute changeset.valid?
  end
end
