defmodule GossipGo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GossipGoWeb.Telemetry,
      GossipGo.Repo,
      {DNSCluster, query: Application.get_env(:gossip_go, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: GossipGo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: GossipGo.Finch},
      # Start a worker by calling: GossipGo.Worker.start_link(arg)
      # {GossipGo.Worker, arg},
      # Start to serve requests, typically the last entry
      GossipGoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GossipGo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GossipGoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
