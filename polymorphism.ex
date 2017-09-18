defprotocol Size do
  @doc "get a size of an elem"

  def size(data)
end

defimpl Size, for: List do
  def size(data) do
    length(data)
  end
end

defimpl Size, for: BitString do
  defdelegate size(data), to: String, as: :length #delegating to String.length
end

defimpl Size, for: Any do
  def size(_) do
    0 #for unknown types, we just return 0
  end
end

defmodule Player do
  @doc "a player does not have a size"
  @derive [Size] #apply any impl to this module, it avoids an exception trying to run Size.size(p :: Player)

  defstruct name: nil


  #to avoid an exception caught for all types, put `@fallback_to_any true` into the protocol you need.
  #then, deriving is not necessary
end

defmodule Sizable do
  defstruct some: [1,2], spec: [1,2]

  #implementation into its proper module
  defimpl Size do #does not require :for
    def size(data) do
      length(data.some) + length(data.spec)
    end
  end
end

defmodule TestMod do
  def test do
    Size.size("hello") |> IO.puts     #5
    Size.size([1,2,3]) |> IO.puts     #3
    Size.size(%Player{}) |> IO.puts   #0
    Size.size(%Sizable{}) |> IO.puts  #4
    Size.size({1,2,3}) #error with tuple due of no implementation found
  end
end