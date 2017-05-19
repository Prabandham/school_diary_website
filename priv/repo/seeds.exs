# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SchoolDiary.Repo.insert!(%SchoolDiary.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# SchoolDetail
alias SchoolDiary.Repo
alias SchoolDiary.SchoolDetail

school_detail = %{
                name: "Hymamshu Jyothi Kala Peta",
                code: "hjkp",
                address: "Malleshwaram, 18th Cross, Beside BSNL office",
                contact_number_1: "9738912733",
                contact_email: "admin@hjkp.com",
                licence_start_date: Ecto.Date.cast!("2017-05-17"),
                licence_end_date: Ecto.Date.cast!("2017-06-17"),
                licence_type: "Trial"
                }
school_details_changeset = SchoolDetail.changeset(%SchoolDetail{}, school_detail)
Repo.insert!(school_details_changeset)
