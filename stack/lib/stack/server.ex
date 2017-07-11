defmodule Stack.Server do
  use GenServer

  def start_link(stash_pid) do
    IO.puts "start link of server"
    {:ok, pid} = GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push(value) do
    GenServer.cast(__MODULE__, {:push, value})
  end

  def init(stash_pid) do
    IO.puts "stash_pid"
    IO.inspect stash_pid
    current_state = Stack.Stash.get_value(stash_pid)
    {:ok, {current_state, stash_pid}}
  end

  def handle_call(:pop, _from, {current_frame, pid}) do
    IO.puts "handle pop" 
    IO.inspect current_frame
    if Enum.count(current_frame) == 5 do
     throw("error")
    end
    last = Enum.fetch!(current_frame, -1) 
    {:reply, last, {Enum.drop(current_frame, -1), pid}}
  end

  def handle_cast({:push, value}, {current_frame, pid}) do
    IO.puts "handle push" 
    IO.inspect current_frame ++ [value]
    {:noreply, {current_frame ++ [value], pid}}
  end

  def terminate(reason, {current_frame, pid}) do
    Stack.Stash.set_value(pid, current_frame)
    IO.puts "Terminating with frame"
    IO.inspect current_frame
  end
    
end
