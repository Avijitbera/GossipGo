
defmodule GossipGo.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:user_id, :binary_id, autogenerate: true}
  schema "users" do
    field :username, :string
    field :email, :string
    field :password_hash, :string
    field :bio, :string
    field :avatar_url, :string
    field :created_at, :naive_datetime

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password_hash, :bio, :avatar_url, :created_at])
    |> validate_required([:username, :email, :password_hash])
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end

end
