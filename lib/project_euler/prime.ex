defmodule ProjectEuler.Prime do
  def largest_prime_factor(number) when number > 0 do
    prime_factors(number) |> Enum.max
  end

  def prime_factors(number) when number == 1, do: [1]
  def prime_factors(number) when number > 1 do
    do_prime_factors(number, 2, []) |> Enum.reverse
  end

  def primes(until) when until <= 0, do: []
  def primes(until) do
    Enum.filter(1..until, &prime?/1)
  end

  def next_prime(number) do
    if prime?(number) do
      number
    else
      next_prime(number + 1)
    end
  end

  def prime?(number) when number <= 0, do: false
  def prime?(number) when number == 1, do: true
  def prime?(number) when number == 2, do: true
  def prime?(number) when number != 2 and rem(number, 2) == 0, do: false
  def prime?(number) do
    do_prime?(number)
  end

  defp do_prime_factors(number, first_factor, result) do
    case division(number, first_factor) do
      {1, 0} -> [first_factor| result]
      {x, 0} -> do_prime_factors(x, first_factor, [first_factor|result])
      _ -> do_prime_factors(number, next_prime(first_factor + 1), result)
    end
  end

  defp division(number, by) do
    {div(number, by), rem(number, by)}
  end

  defp do_prime?(number) do
    not divisible_until?(number, 2, number - 1)
  end

  defp divisible_until?(number, from, to) do
    cond do
      rem(number, from) == 0 -> true
      from == to -> false
      true -> divisible_until?(number, from + 1, to)
    end
  end
end