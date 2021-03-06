defmodule Ockam do
  @moduledoc """
  Ockam is a collection of protocols and toolkits for building connected
  systems that you can trust.
  """

  use Application

  require Logger

  # Called when the Ockam application is started.
  #
  # This function is called when an application is started using
  # `Application.start/2`, `Application.ensure_started/2` etc.
  #
  #
  @doc false
  def start(_type, _args) do
    Logger.info("Starting #{__MODULE__}")

    # Specifications of child processes that will be started and supervised.
    #
    # See the "Child specification" section in the `Supervisor` module for more
    # detailed information.
    children = [
      Ockam.Router,
      Ockam.Controller,
      {DynamicSupervisor, name: Ockam.Worker.Supervisor, strategy: :one_for_one},
      {DynamicSupervisor, name: Ockam.Transport.UDP.Supervisor, strategy: :one_for_one},
      {DynamicSupervisor, name: Ockam.Transport.UDP.Portal.Supervisor, strategy: :one_for_one},
      {DynamicSupervisor, name: Ockam.Stream.Supervisor, strategy: :one_for_one},
      {DynamicSupervisor, name: Ockam.Channel.Supervisor, strategy: :one_for_one}
    ]

    # Start a supervisor with the given children. The supervisor will inturn
    # start the given children.
    #
    # The :one_for_one supervision strategy is used, if a child process
    # terminates, only that process is restarted.
    #
    # See the "Strategies" section in the `Supervisor` module for more
    # detailed information.
    Supervisor.start_link(children, strategy: :one_for_one, name: __MODULE__)
  end
end
