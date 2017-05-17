defmodule SchoolDiary.PageController do
  use SchoolDiary.Web, :controller

  def index(conn, _params) do
  #    contact_changeset = Contact.changeset(%Contact{})
    render conn, "index.html"#, contact_changeset: contact_changeset
  end
end
