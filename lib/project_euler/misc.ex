defmodule ProjectEuler.Misc do
  def multiples_of_3_and_5(below) when below > 1 do
    1..(below - 1)
    |> Enum.filter(fn(x) -> rem(x, 3) == 0 or rem(x, 5) == 0 end)
    |> Enum.reduce(0, fn(x, acc) -> x + acc end)
  end
end
