defmodule HelloModule do
  @moduledoc """
    some doc for this module
  """
  @module_const 10
  @another "ok"

  def public do
    #shared with all modules
    @module_const #read at compile time
  end

  defp private do
    #closed for this module
    @another #read at compile time
  end

  def foo do
    # anonymous function, closed into function `foo` scope
    anonymous = fn y -> y * y  / 2 end
    anonymous_shorthand = &(&1 * &1 / 2)

    anonymous.(10) |> IO.puts
    anonymous_shorthand.(10) |> IO.puts

    anonymous_multiple_body = fn
      x when x > 0 -> x * x
      x -> x * (-1) #otherwise
    end

    anonymous_multiple_body.(10) |> IO.puts
    anonymous_multiple_body.(-1) |> IO.puts
  end
end