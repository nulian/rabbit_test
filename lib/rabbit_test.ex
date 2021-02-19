defmodule RabbitTest do
  use Application

  require Logger

  def start(_, _) do
    if Application.get_env(:roger, :start_on_application, true) do
      start_link()
    else
      Supervisor.start_link([], strategy: :one_for_one)
    end
  end

  def start_link(_opts \\ []) do
    import Supervisor.Spec, warn: false

    children = [
      RabbitSupervisor
    ]

    opts = [strategy: :one_for_one, name: RabbitTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
