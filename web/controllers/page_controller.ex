defmodule SchoolDiary.PageController do
  use SchoolDiary.Web, :controller
  alias SchoolDiary.Contact
  alias SchoolDiary.Repo
  alias SchoolDiary.SchoolDetail

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
      {:error, _contact} ->
        conn 
        |> json(%{status: "error", message: "Some thing was not filled correctly. Please try again."})
    end
  end

  def request_account_name(conn, _params) do
    account_changeset = SchoolDetail.validate_account_chagenset(%SchoolDetail{})
    render conn, "request_account.html", account_changeset: account_changeset
  end

  def validate_account_name(conn, %{"school_detail" => account_params}) do
    # conn.private[:subdomain]
    code = account_params["code"] 
    query = from s in SchoolDetail, where: s.code == ^code
    found = Repo.one(query)
    IO.inspect found
    case is_nil(found) do
      true ->
        conn
        |> put_flash(:error, "We do not have any school registered with code <b>" <> code <> "</b> Please make sure you are spelling the code correctly.")
        |> redirect(to: "/login")
      false ->
        found_account = "http://" <> code <> ".schooldiary.com"
        conn
        |> redirect(external: found_account)
    end
  end
end
