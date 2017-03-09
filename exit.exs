defmodule A do
  def killer do
 		exit(:boom)
 	end

 	def run do
 		spawn_link(__MODULE__, :killer, [])
 		receive do
 			_ -> IO.inspect "Happy"
 			after 500 -> IO.inspect "Super happy"
 		end
 	end
end
