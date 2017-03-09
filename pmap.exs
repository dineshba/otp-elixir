defmodule Parallel do
  def pmap(collection, fun) do
    me = self
    collection
    |> Enum.map(fn element -> spawn_link(fn -> send me, fun.(element) end) end)
    |> Enum.map(fn pid -> 
    IO.inspect pid 
    receive do value -> value end end)
  end
end
