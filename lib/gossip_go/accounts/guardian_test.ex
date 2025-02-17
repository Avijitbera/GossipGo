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
    test "resource_from_claims/1 returns user from claims" do
      user_attrs = %{
        username: "testuser",
        email: "test@example.com",
        password: "password123"
      }

      {:ok, user} = Accounts.register_user(user_attrs)
      claims = %{"sub" => to_string(user.user_id)}
      assert {:ok, resource} = Guardian.resource_from_claims(claims)
      assert resource.user_id == user.user_id
    end
  end
end
