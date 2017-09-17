defmodule HelloModule do
  def public do
    #shared with all modules
  end

  defp private do
    #closed for this module
  end

  def foo do
    # anonymous function, closed into function `foo` scope
    anonymous = fn y -> y * y  / 2 end
    anonymous.(10) |> IO.puts

    anonymous_multiple_body = fn
      x when x > 0 -> x * x
      x -> x * (-1) #otherwise
    end

    anonymous_multiple_body.(10) |> IO.puts
    anonymous_multiple_body.(-1) |> IO.puts
  end
end