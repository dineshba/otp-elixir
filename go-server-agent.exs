defmodule GoServer do
  def start() do
    pid = spawn(__MODULE__, :listen, [[]])
    :global.register_name(:go_server, pid)
  end
  
  def register(agent) do
    send :global.whereis_name(:go_server), {:register, agent}
  end

  def listen(agents) do
    receive do
    {:register, agent} -> IO.puts "registered"
                          listen([agent|agents])
    after 2000 -> IO.inspect "2 sec"
                  Enum.each(agents, fn agent -> send agent, {:work, "pls do"} end)
                  listen(agents)
    end
  end
end


defmodule GoAgent do
  def start do
    pid = spawn(__MODULE__, :listen, [])
    GoServer.register(pid)
  end

  def listen() do
    receive do
      {:work, message} -> IO.puts "Got work #{message}"
            listen()
    end
  end

end
