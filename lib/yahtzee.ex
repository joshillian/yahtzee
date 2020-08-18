defmodule Yahtzee do
  @moduledoc """
  Documentation for `Yahtzee`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Yahtzee.hello()
      :world

  """
  @default_map  %{6 => 0,5 => 0, 4 => 0, 3 => 0, 2 => 0, 1 => 0}
  #HA - rolling is not needed, read the instructions brah
  def roll_dice do
    :rand.uniform(6)
  end

  def roll do
    Enum.map(0..4, fn _ -> roll_dice end) #TODO, named function
    |> Enum.sort(:desc)
  end

  def score(:chance, dice) do
    Enum.sum(dice)
  end

  def score(:yahtzee, dice) do
    if Enum.all?(dice, fn e -> List.first(dice) == e end), do: 50, else: 0
  end



  def score(:sixes,dice)  do score_singles(6,dice) end
  def score(:fives,dice)  do score_singles(5,dice) end
  def score(:fours,dice)  do score_singles(4,dice) end
  def score(:threes,dice) do score_singles(3,dice) end
  def score(:twos,dice)   do score_singles(2,dice) end
  def score(:ones,dice)   do score_singles(1,dice) end

  def score(:pair, dice) do

  end

  def score(:two_pairs, dice) do

  end

  def score(:three_of_a_kind, dice) do #sum the three end
    0
  end

  def score(:four_of_a_kind, dice) do #TODO this is broke end; #sum the four
    dice
    |> Enum.sort
    |> List.delete_at(4)
    |> IO.inspect
    if Enum.all?(dice, fn e -> List.first(dice) == e end), do: Enum.sum(dice), else: 0
  end


  def score(:small_straight,  [1,2,3,4,5]) do 15 end
  def score(:small_straight, _) do 0 end
  def score(:large_straight, [2,3,4,5,6]) do  20 end
  def score(:large_straight, _) do 0 end

  def score(:full_house, dice) do

  end


  defp score_singles(num,dice) do
    Map.merge(@default_map,Enum.frequencies(dice))[num] * num
  end


end
