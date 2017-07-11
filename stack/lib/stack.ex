defmodule Stack do
  use Application

  def start(_type, _args) do
    IO.puts "start of Stack application"
    {:ok, _pid} = Stack.Supervisor.start_link([1,2])
  end
end
