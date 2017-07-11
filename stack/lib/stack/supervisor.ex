defmodule Stack.Supervisor do
  use Supervisor

  def start_link(initial_value) do
    IO.puts "start_link of supervisor"
    result = {:ok, pid} = Supervisor.start_link(__MODULE__, [])
    start_workers(pid, initial_value)
    result
  end

  def start_workers(sup, initial_value) do
    {:ok, stash} = Supervisor.start_child(sup, worker(Stack.Stash, [initial_value]))
    Supervisor.start_child(sup, worker(Stack.Server, [stash]))
  end

  def init(_) do
    IO.puts "init of supervisor"
    supervise [], strategy: :one_for_one
  end

end
