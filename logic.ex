#cond, if/elseif statements

IO.puts(if false do "never done" else "done" end)

#with extra verbosity
IO.puts(if false, do: "never done", else: "done")

test = if true, do: (
  a = 2 + 2
  a = a + 2
)

if true do
  IO.puts(test)
end

unless true do
  "never called"
end

#used for if/elseif/else

x = 10

cond do
  x == 10 ->
    IO.puts("got ten")
  x == 20 ->
    IO.puts("lol")
  true -> "else"
end

x = 20

x = cond do x == 10 -> "got ten"; true -> "otherwise" end
IO.puts(x)

#case, pattern matching

y = :array
x = [:some, y, :values]

case x do
  x when hd(x) === y -> IO.puts("won't match, head of x is :some")
  [_, ^y, z] -> IO.puts("matched with z=#{z} & head hidden")
end

#^ used to get a value of an existing variable
#^ only usable on matching expressions