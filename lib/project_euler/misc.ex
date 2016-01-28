defmodule ProjectEuler.Misc do
  def multiples_of_3_and_5(below) when below > 1 do
    1..(below - 1)
    |> Enum.filter(fn(x) -> rem(x, 3) == 0 or rem(x, 5) == 0 end)
    |> Enum.reduce(0, fn(x, acc) -> x + acc end)
  end

  def largest_palindrome_product(from, to) do
    (for i <- from..to, j <- from..to, do: i * j)
    |> Enum.filter(fn (x) ->
                    (x
                    |> Integer.to_string
                    |> String.reverse) == Integer.to_string(x)
                  end)
    |> Enum.max
  end
end
