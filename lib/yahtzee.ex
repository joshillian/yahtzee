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
      iex> Yahtzee.score(6, [1,6,2,6,3])
      12
  """
  @default_map %{6 => 0, 5 => 0, 4 => 0, 3 => 0, 2 => 0, 1 => 0}
  @spec score(atom, list(integer)) :: integer
  def score(:chance, dice) do
    Enum.sum(dice)
  end

  @spec score(atom, list(integer)) :: integer
  def score(:yahtzee, dice) do
    dice
    |> yahtzee?()
    |> score_yahtzee()
  end

  @spec score(integer, list(integer)) :: integer
  def score(single_score, dice) when is_integer(single_score) do
    dice
    |> Enum.filter(&(&1 == single_score))
    |> Enum.sum()
  end

  @spec score(atom, list(integer)) :: integer
  def score(:pair, dice) do
    dice
    |> tally()
    |> extract_pairs()
    |> score_a_pair()
  end

  @spec score(atom, list(integer)) :: integer
  def score(:two_pairs, dice) do
    dice
    |> tally()
    |> extract_pairs()
    |> score_pairs()
  end

  @spec score(atom, list(integer)) :: integer
  def score(category, dice) when category == :four_of_a_kind or category == :three_of_a_kind do
    dice
    |> tally()
    |> score_kinds()
  end

  @spec score(atom, list(integer)) :: integer
  def score(category, dice) when category == :small_straight or category == :large_straight do
    dice
    |> Enum.sort()
    |> score_straights()
  end

  @spec score(atom, list(integer)) :: integer
  def score(:full_house, dice) do
    dice
    |> tally()
    |> score_full_house()
  end

  @spec score_yahtzee(boolean) :: integer
  defp score_yahtzee(true) do
    50
  end

  defp score_yahtzee(false) do
    0
  end

  @spec yahtzee?(list(integer)) :: boolean
  defp yahtzee?(dice) do
    dice
    |> Enum.uniq()
    |> Enum.count() == 1
  end

  @spec tally(list(integer)) :: map
  defp tally(dice) do
    Map.merge(@default_map, Enum.frequencies(dice))
  end

  @spec score_kinds(map) :: integer
  defp score_kinds(tally_map) do
    Enum.reduce(tally_map, 0, &sum_kinds/2)
  end

  @spec sum_kinds(tuple, integer) :: integer
  defp sum_kinds({k, v}, acc) when v == 4 or v == 3 do
    k * v + acc
  end

  defp sum_kinds(_, acc) do
    acc
  end

  @spec extract_pairs(map) :: map
  defp extract_pairs(tally_map) do
    Enum.filter(tally_map, fn {_, v} -> v == 2 end)
  end

  @spec score_pairs(map) :: integer
  defp score_pairs(pairs) when length(pairs) == 2 do
    Enum.reduce(pairs, 0, fn {k, v}, acc -> k * v + acc end)
  end

  defp score_pairs(_) do
    0
  end

  @spec score_a_pair(map) :: integer
  defp score_a_pair(pair) when length(pair) == 0 do
    0
  end

  @spec score_a_pair(map) :: integer
  defp score_a_pair(pair) do
    pair
    |> max_of_a_pair()
    |> key_from_tuple()
    |> multiply_by(2)
  end

  @spec max_of_a_pair(map) :: tuple
  defp max_of_a_pair(pair) do
    Enum.max_by(pair, fn {k, _} -> k end)
  end

  @spec key_from_tuple(tuple) :: integer
  defp key_from_tuple(tuple) do
    elem(tuple, 0)
  end

  @spec multiply_by(integer, integer) :: integer
  defp multiply_by(operand, factor) do
    operand * factor
  end

  @spec score_straights(list(integer)) :: integer
  defp score_straights([2, 3, 4, 5, 6]) do
    20
  end

  defp score_straights([1, 2, 3, 4, 5]) do
    15
  end

  defp score_straights(_) do
    0
  end

  @spec score_full_house(map) :: integer
  def score_full_house(tallied_map) do
    Enum.reduce(tallied_map, 0, &full_house_summer/2)
  end

  @spec full_house_summer(tuple, integer) :: integer
  defp full_house_summer({k, v}, acc) when v == 3 or v == 2 do
    k * v + acc
  end

  defp full_house_summer(_, acc) do
    acc
  end
end
