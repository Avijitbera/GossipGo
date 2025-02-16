
defmodule GossipGo.Accounts.Account do
  alias GossipGo.Accounts.User
  alias GossipGo.Repo
  alias Comeonin.Bcrypt

  def register_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Ecto.Changeset.put_change(:password_hash, Bcrypt.hashpwsalt(attrs["password"]))
    |> Repo.insert()
  end

  def authenticate_user(email, password) do
    user = Repo.get_by(User, email: email)
    if user && Bcrypt.verify_pass(password, user.password_hash) do
      {:ok, user}
    else
      {:error, :invalid_credentials}
    end
  end

  def get_user!(user_id) do
    Repo.get!(User, user_id)
  end

end
