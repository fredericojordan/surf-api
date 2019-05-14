defmodule WavesWeb.Router do
  use WavesWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WavesWeb do
    pipe_through :api

    get "/", SpotsController, :spots
  end

end
