defmodule Chain1 do
  def start(n) do
    last = Enum.reduce(1..n, self, fn (_, send_to) -> spawn(__MODULE__, :counter, [send_to]) end)
    send last, 0
  
    receive do
      n -> IO.inspect "Received #{n}"
    end
  end

  def counter(send_to) do
    receive do
      n -> send send_to, n + 1
    end
  end

  def run(n), do: IO.inspect :timer.tc(__MODULE__, :start, [n])
end
