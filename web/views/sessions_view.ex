defmodule SchoolDiary.SessionsView do
  use SchoolDiary.Web, :view

  def logo(subdomin) do
    "/images/logos/" <> subdomin <> ".jpg"
  end
end
