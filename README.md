# otp-elixir

* Presentation used for 
[Why Erlang/Elixir + Getting started with Elixir](https://docs.google.com/presentation/d/1HM_eGs-3_mAHytGVXcGnwZ1pf1AHe2X690mkXshgkrE/edit#slide=id.g1c2b4f0ab4_0_34)


### Some commands which i used during session:
* `iex` for interactive terminal
* `c("filename.exs")` for loading/re-compiling in repl
* `elixir -r filename.exs -e "Module.func(args)"` for executing function directly from terminal
* `iex --sname shortName` and `iex --name dineshb@my_ip_address` to name the nodes
* `iex --cookie your_cookie` to set the cookie for your erlang node
* `Node.self` to display current node name
* `Node.list` to list all the connected nodes
* `Node.connect :node_name` to connect

### Session 1 agenta
* How to send message between two processes that are running in
    1. `iex` to `module`
    2. `one module` to `another module`
* How much time it takes to create 1 lakh processes and send message between them to complete a task

### Session 2 agenta
* How to create a server/master in one node and multiple agent/slave in mutliple nodes and communicate between them
