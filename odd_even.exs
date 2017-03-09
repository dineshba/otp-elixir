defmodule Even do
  def print do
    receive do
      {10000, _next_pid} -> IO.inspect "stopped"
      {n, next_pid} -> IO.inspect "Even #{n}"
           send next_pid, {n+1, spawn(__MODULE__, :print, [])}
    end
  end
end

defmodule Odd do
  def print do
    receive do
      {n, next_pid} -> IO.inspect "Odd #{n}"
      send next_pid, {n+1, spawn(__MODULE__, :print, [])}
    end
  end
end

defmodule Abc do
   def run do
     even = spawn(Even, :print, [])
     odd = spawn(Odd, :print, [])
     :timer.tc(fn -> send even, {0, odd} end)
   end
end
