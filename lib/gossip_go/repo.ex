defmodule GossipGo.Repo do
  use Ecto.Repo,
    otp_app: :gossip_go,
    adapter: Ecto.Adapters.Postgres
end
