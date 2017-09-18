defprotocol NetworkMessage do
  @doc "a network message"
  def serialize(msg);
  def deserialize(msg);
end

defmodule HelloMessage do
  @enforce_keys [:key, :content]
  defstruct key: nil, content: nil

  defimpl NetworkMessage do
    def serialize(msg) do
      msg.key <> " " <> msg.content
    end

    def deserialize(msg) do
      msg
    end
  end

  defimpl NetworkMessage, for: BitString do
    def serialize(msg) do
      msg
    end

    def deserialize(msg) do
      [key, content] = String.split(msg, " ", parts: 2)
      %HelloMessage{key: key, content: content}
    end
  end
end

defmodule NetworkProtocol do
  def test do
    message = %HelloMessage{key: "abc", content: "defgh"}
    performed = NetworkMessage.serialize(message) |> NetworkMessage.deserialize |> IO.inspect

    if message === performed do IO.puts("true") end
  end
end