#behaviours are used for inheritance :)

defmodule NetworkMessage do
  @doc "a network message"
  @callback serialize(msg :: NetworkMessage) :: String.t;
  @callback deserialize(msg :: String.t) :: NetworkMessage;
end

defmodule HelloMessage do
  @behaviour NetworkMessage

  @enforce_keys [:key, :content]
  defstruct key: nil, content: nil

  def serialize(msg) do
    msg.key <> " " <> msg.content
  end

  def deserialize(msg) do
    [key, content] = String.split(msg, " ", parts: 2)
    %HelloMessage{key: key, content: content}
  end
end

defmodule NetworkProtocol do
  def test do
    message = %HelloMessage{key: "abc", content: "defgh"}
    performed = HelloMessage.serialize(message)
                |> HelloMessage.deserialize
                |> IO.inspect

    if message === performed do
      IO.puts("true") end
  end
end