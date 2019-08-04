defmodule Doan do
use Bitwise
  def test(code, key) do
    value = code &&& key
    IO.puts "+++++"
    IO.puts "key:#{key},code:#{code},code &&& key:#{value},value == key:"
    case value do
      key ->
        IO.puts "value:#{value}, key:#{key}, value is true"
      _ ->
        IO.puts "value:#{value}, key:#{key}, value is false"
    end
  end

def start() do
  current = self()
  spawn(Doan, :read, [current])
  spawn(Doan, :write, [current])
  loop()
end

def loop do
  receive do
    {:read, 1} ->
        IO.puts "this  is one"

    {:write, 1} ->
        IO.puts "THIS IS ONE OF WRITE"

    {:read, 2} ->
        IO.puts "this is two"

    {:write, 2} ->
        IO.puts "THIS IS TWO OF WRITE"
    _ -> IO.puts "this is dont care "

  end
  loop()
end


def read(pid) do
  send pid, {:read, 1}
  :timer.sleep(500)
  read(pid)
end


def write(pid) do
  send pid, {:write, 1}
  :timer.sleep(500)
  write(pid)
end

end
# c("doan.ex")
