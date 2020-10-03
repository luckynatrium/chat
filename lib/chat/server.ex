defmodule Chat.Server do

  #API
  def start_link do
    GenServer.start_link(__MODULE__, [], name: :chat_room)
  end

  def add_message (msg) do
    GenServer.cast(:chat_room, {:add_message, msg})
  end

  def get_messages() do
    GenServer.call(:chat_room, :get_messages)
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
