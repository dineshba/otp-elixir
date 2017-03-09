defmodule Odd do
	def print do
		receive do
		{sender, count} -> IO.puts "#{count} old"
                       next = spawn(__MODULE__, :print, [])
						           send sender, {next, count + 1}
	    end
#	    print
    end
end

defmodule Even do
	def print do
		receive do
		{sender, 100000} -> IO.puts "100000 even"
		{sender, count} -> IO.puts "#{count} even"
						           next = spawn(__MODULE__, :print, [])
                       send sender, {next, count + 1}
	    end
#	    print
    end
end
