defmodule Chat.Server do

  #API
  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def add_message(pid, msg) do
    GenServer.cast(pid, {:add_message, msg})
  end

  def get_messages(pid) do
    GenServer.call(pid, :get_messages)
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
