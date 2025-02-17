defmodule GossipGo.Accounts.GuardianTest do
  use GossipGO.DataCase

  alias GossipGo.Guardian
  alias GossipGo.Accounts

  describe "Guardian" do
    test "subject_for_token/1 returns user_id as string" do
      user_attrs = %{
        username: "testuser",
        email: "test@example.com",
        password: "password123"
      }

      {:ok, user} = Accounts.register_user(user_attrs)
      assert {:ok, user_id} = Guardian.subject_for_token(user, %{})
      assert user_id == to_string(user.user_id)
    end
  end
end
