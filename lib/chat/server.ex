defmodule Chat.Server do
  use GenServer
  #API
  def start_link(name) do
    GenServer.start_link(__MODULE__, [], name: via_tuple(name))
  end

  def add_message(name, msg) do
    GenServer.cast(via_tuple(name), {:add_message, msg})
  end

  def get_messages(name) do
    GenServer.call(via_tuple(name), :get_messages)
  end

  defp via_tuple(name) do
    {:via, :gproc, {:n, :l, {:chat_room, name}}}
  end

  #SERVER

  def init(messages) do
    {:ok, messages}
  end
  def handle_cast({:add_message, msg}, messages) do
    {:noreply, [msg|messages]}
  end
  def handle_call(:get_messages, _from, messages) do
    {:reply,messages, messages}
  end
end
