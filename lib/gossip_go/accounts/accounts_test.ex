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

  end

end
