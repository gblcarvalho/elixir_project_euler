defmodule ProjectEuler.Fibonacci do
  def sum_even_fib(until) when until > 0 do
    do_sum_even_fib(0, 1, until, 0)
  end

  defp do_sum_even_fib(initial, curr, until, sum) do
    cond do
      curr >= until -> sum
      rem(curr, 2) == 0 -> do_sum_even_fib(curr, curr + initial,
                                           until, curr + sum)
      true -> do_sum_even_fib(curr, curr + initial, until, sum)
    end
  end
end
