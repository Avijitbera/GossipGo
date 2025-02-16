defmodule GossipGo.Accounts.Guardian do

  use Guardian, otp_app: :gossip_go
  alias GossipGo.Accounts

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.user_id)}
  end

end
