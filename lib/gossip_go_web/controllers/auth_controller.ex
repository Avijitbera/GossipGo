defmodule GossipGoWeb.AuthController do
  use GossipGoWeb, :controller

  alias GossipGo.Accounts
  alias GossipGo.Guardian

  def login(cann, %{"email" => email, "password" => password})
  do
    case Accounts.authenticate(email, password) do
      {:ok, user} ->
        {:ok, token, _claims} = Guardian.encode_and_sign(user)
        conn
        |> put_status(:ok)
        |> render("login.json", %{token: token})
      {:error, reason} ->
        conn
        |> put_status(:unauthorized)
        |> render("error.json", %{reason: reason})
    end
  end
end
