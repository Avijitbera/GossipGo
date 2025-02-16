defmodule GossipGoWeb.Router do
  use GossipGoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GossipGoWeb do
    pipe_through :api

    post "/login", AuthController, :login
  end





end
