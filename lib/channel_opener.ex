defmodule ChannelOpener do
  @moduledoc false

  use GenServer, restart: :temporary

  def start_link(_init_arg) do
    GenServer.start_link(__MODULE__, [])
  end

  def init([]) do
    {:ok, conn} = AMQP.Application.get_connection()
    {:ok, channel} = AMQP.Channel.open(conn, {AMQP.DirectConsumer, self()})

    {:ok, %{channel: channel}}
  end

end
