defmodule Player do
  @enforce_keys [:id, :name] #keys that must be initialized
  defstruct [:id, :name, level: 1] #level got 1 as default value
end

defmodule World do
  def create_player do
    #create
    henry = %Player{id: 1, name: "henry", level: 100}

    #access
    level = henry.level |> IO.puts

    #modify
    henry = %{henry | level: 2}
  end
end

#since Elixir it totally immutable, to modify a var, we must rebind variables to change the value they point to