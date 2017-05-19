defmodule SchoolDiary.SubdomainRouter do
  use SchoolDiary.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", SchoolDiary do
    pipe_through :browser # Use the default browser stack

    get "/", SessionsController, :index, as: :login
    get "/login", SessionsController, :index, as: :login
  end

  # Other scopes may use custom stacks.
  # scope "/api", SchoolDiary do
  #   pipe_through :api
  # end
end
