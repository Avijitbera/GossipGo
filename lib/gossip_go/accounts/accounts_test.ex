defmodule GossipGo.Accounts.AccountsTest do
  use GossipGo.DataCase

  alias GossipGo.Accounts

  describe "users" do
    test "register_user/1 creates a user" do
      attrs = %{
        "username" => "testuser",
        "email" => "test@mail.com",
        "password" => "password123"
      }
      assert {:ok, %Accounts.User{}} = Accounts.register_user(attrs)
      assert user.username == "testuser"
      assert user.email == "test@example.com"
    end

    test "authenticate_user/2 authenticates the user" do
      attrs = %{
        "username" => "testuser",
        "email" => "test@mail.com",
        "password" => "password123"
      }
      {:ok, user} = Accounts.register_user(attrs)
      assert {:ok, authenticated_user} = Accounts.authenticate_user(user.email, attrs["password"])

      assert authenticated_user.user_id == user.user_id
    end

  end

end
