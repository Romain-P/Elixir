addition = 5 + 4
sub = 2 - 1
div = 4 / 1
mut = 15 * 10

#euclide
div(3, 2) #1 #division with integers
rem(3, 2) #2 #remaining
# 1 + 2 = 3

# operator |>
# take the last result and put it in the first argument of the next function
Range.new(1, 10) |> Enum.map(fn x -> x * x end) |> Enum.filter(fn x -> x end) |> IO.inspect
