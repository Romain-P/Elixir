defprotocol NetworkMessage do
  @doc "a network message"
  def serialize(msg);
end

defmodule HelloMessage do
  @enforce_keys [:key, :content]
  defstruct key: nil, content: nil

  defimpl NetworkMessage do
    def serialize(msg) do
      msg.key <> " " <> msg.content
    end
  end

  def deserialize(msg) do
    [key, content] = String.split(msg, " ", parts: 2)
    %HelloMessage{key: key, content: content}
  end
end

defmodule NetworkProtocol do
  def test do
    message = %HelloMessage{key: "abc", content: "defgh"}
    performed = NetworkMessage.serialize(message) |> HelloMessage.deserialize |> IO.inspect

    if message === performed do IO.puts("true") end
  end
end