#catch a known error
try do
  :atom + 10
rescue x in ArithmeticError -> IO.puts("catched #{x.message}") end

#catch any error
try do
  #some error
rescue x -> IO.puts(x.message) end

#throw an error with a value to catch
try do
  Enum.each 14..50, fn(x) -> if (rem(x, 13) == 0) do throw(x) end end
catch
  x -> "got #{x}" |> IO.puts #got 26
end

#raise exceptions
try do
  raise "hello"
rescue
  x in RuntimeError -> x.message |> IO.puts
end

try do
  raise ArgumentError, message: "custom error"
rescue
  x in RuntimeError -> "won't be called"
  x in ArgumentError -> x.message |>IO.puts #called
end