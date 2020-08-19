defmodule Yahtzee do
  @moduledoc """
  Documentation for module used to score Yahtzee
  """

  @doc """
  Scoring dice rolls per category of roll (i.e. yahtzee, chance)

  ## Examples

      iex> Yahtzee.score(:chance, [1,2,3,4,5])
      15
      iex> Yahtzee.score(:yahtzee, [2,2,2,2,2])
      50
      iex> Yahtzee.score(:sixes, [1,6,2,6,3])
      12
  """
  @default_map %{6 => 0, 5 => 0, 4 => 0, 3 => 0, 2 => 0, 1 => 0}
  @spec score(atom, list(integer)) :: integer
  def score(:chance, dice) do Enum.sum(dice) end

  def score(:yahtzee, dice) do
    if Enum.all?(dice, fn e -> List.first(dice) == e end), do: 50, else: 0
  end


  def score(:sixes, dice) do score_singles(6, dice) end
  def score(:fives, dice) do score_singles(5, dice) end
  def score(:fours, dice) do score_singles(4, dice) end
  def score(:threes, dice) do score_singles(3, dice) end
  def score(:twos, dice) do score_singles(2, dice) end
  def score(:ones, dice) do score_singles(1, dice) end

  def score(:pair, dice) do
    pairs = Enum.filter(tally(dice), fn {_, v} -> v == 2 end)
    cond do
      Enum.empty?(pairs) ->
        0
      true ->
        max_pair = Enum.max_by(pairs, fn {k, _} -> k end)
        elem(max_pair, 0) * 2
    end
  end

  def score(:two_pairs, dice) do
    pairs = Enum.filter(tally(dice), fn {_, v} -> v == 2 end)
    if length(pairs) == 2 do
      Enum.reduce(pairs, 0, fn {k, v}, acc -> k * v + acc end)
    else
      0
    end
  end

  def score(:three_of_a_kind, dice) do
    dice
    |> tally
    |> Enum.reduce(0, fn {k, v}, acc -> if v == 3, do: k * v + acc, else: acc end)
  end

  def score(:four_of_a_kind, dice) do
    dice
    |> tally
    |> Enum.reduce(0, fn {k, v}, acc -> if v == 4, do: k * v + acc, else: acc end)
  end

  def score(:small_straight, dice) do
    case Enum.sort(dice) do
      [1, 2, 3, 4, 5] -> 15
      _ -> 0
    end
  end

  def score(:large_straight, dice) do
    case Enum.sort(dice) do
     [2, 3, 4, 5, 6] -> 20
      _ -> 0
    end
  end

  def score(:full_house, dice) do
    dice
    |> tally
    |> Enum.reduce(0, fn {k, v}, acc ->
      case v do
        3 -> k * v + acc
        2 -> k * v + acc
        _ -> acc
      end
    end)
  end

  @spec tally(list(integer)) :: map
  defp tally(dice) do
    Map.merge(@default_map, Enum.frequencies(dice))
  end

  @spec score_singles(atom, list(integer)) :: integer
  defp score_singles(num, dice) do
    dice
    |> Enum.filter(& &1 == num)
    |> Enum.sum
  end
end
