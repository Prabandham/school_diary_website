defmodule SchoolDiary.SessionsController do
  use SchoolDiary.Web, :controller

  def index(conn, _params) do
    render conn, :index
  end
end
