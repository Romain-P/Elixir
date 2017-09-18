#since Elixir is immutable, loops are not possible to apply logic on enumerables
#Recursion is a big part of Elixir

defmodule RList do

  ##sum a list

  def sum_list(x) do
    sum_list(x, 0)
  end

  defp sum_list([head | tail], add) do
    sum_list(tail, head + add)
  end

  #will match when list is empty, and then return `add`
  defp sum_list([], add) do
    add
  end

  ##list#map

  def maps([head | tail], func) do
    [func.(head) | maps(tail, func)]
  end

  defp maps([], func) do
    []
  end
end

defmodule Test do
  def sum_list do
    list = [3, 7, 10]
    sum = RList.sum_list(list) #gives 20
  end

  def map_list do
    list = [1, 2, 3, 4]
    mapped = RList.maps(list, fn x -> x * 2 end) #gives [2, 4, 6, 8]
  end
end