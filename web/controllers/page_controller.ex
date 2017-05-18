defmodule SchoolDiary.PageController do
  use SchoolDiary.Web, :controller
  alias SchoolDiary.Contact
  alias SchoolDiary.Repo

  def index(conn, _params) do
    contact_changeset = Contact.changeset(%Contact{})
    render conn, "index.html", contact_changeset: contact_changeset
  end

  def contact_request(conn, %{"contact" => contact_params}) do
    contact = Contact.changeset(%Contact{}, contact_params)
    case Repo.insert(contact) do
      {:ok, contact} ->
        conn 
        |> json(%{status: "success", message: "Thank you " <> contact.name <> ", we have got your mail and will get in touch with you shortly !!"})
      {:error, contact} ->
        IO.inspect contact
        conn 
        |> json(%{status: "error", message: "Some thing was not filled correctly. Please try again."})
    end
  end
end
