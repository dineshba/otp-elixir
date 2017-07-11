defmodule Stack.Stash do
  use GenServer
  
  def start_link(initial_value) do
    IO.puts "stash start link"
    {:ok,_pid} = GenServer.start_link( __MODULE__, initial_value)
    IO.puts "pid of stash"
    IO.inspect _pid
    {:ok, _pid}
  end

  def get_value(pid) do
    GenServer.call pid, :get
  end

  def set_value(pid, value) do
    GenServer.cast pid, {:set, value} 
  end

  def handle_call(:get, _from, current_value) do
    {:reply, current_value, current_value}
  end

  def handle_cast({:set, value}, current_value) do
    {:noreply, value}
  end

end
