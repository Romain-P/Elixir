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

defimpl Size, for: any do
  def size(data) do
    0 #for unknown types, we just return 0
  end
end

defmodule Player do
  @doc "a player does not have a size"

  @derive Size #apply any impl to this module, it avoids an exception trying to run Size.size(p :: Player)

  #to avoid an exception caught for all types, put `@fallback_to_any true` into the protocol you need.
  #then, deriving is not necessary
end