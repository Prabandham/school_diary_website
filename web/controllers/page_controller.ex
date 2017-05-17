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
      {:ok, _contact} ->
        conn 
        |> json(%{status: "success", message: "Thank you, we will get in touch with you shortly !!"})
      {:error, contact} ->
        IO.inspect contact
        conn 
        |> render("index.html", contact_changeset: contact)
    end
  end
end
