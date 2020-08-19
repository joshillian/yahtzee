defmodule YahtzeeTest do
  use ExUnit.Case
  doctest Yahtzee

  describe "score/2 - chance" do
    test "return 0" do
      assert Yahtzee.score(:chance, []) == 0
    end

    test "calculate" do
      assert Yahtzee.score(:chance, [5, 3, 1, 2, 2]) == 13
    end
  end

  describe "score/2 - yahtzee" do
    test "return 0" do
      assert Yahtzee.score(:yahtzee, [6, 1, 2, 3, 4]) == 0
    end

    test "calculate yahtzee for all 6s" do
      assert Yahtzee.score(:yahtzee, [6, 6, 6, 6, 6]) == 50
    end

    test "calculate yahtzee for all 5s" do
      assert Yahtzee.score(:yahtzee, [5, 5, 5, 5, 5]) == 50
    end

    test "calculate yahtzee for all 4s" do
      assert Yahtzee.score(:yahtzee, [4, 4, 4, 4, 4]) == 50
    end

    test "calculate yahtzee for all 3s" do
      assert Yahtzee.score(:yahtzee, [3, 3, 3, 3, 3]) == 50
    end

    test "calculate yahtzee for all 2s" do
      assert Yahtzee.score(:yahtzee, [2, 2, 2, 2, 2]) == 50
    end

    test "calculate yahtzee for all 1s" do
      assert Yahtzee.score(:yahtzee, [1, 1, 1, 1, 1]) == 50
    end
  end

  describe "score/2 - sixes" do
    test "return 0" do
      assert Yahtzee.score(:sixes, [5, 2, 3, 4, 1]) == 0
    end

    test "calculate" do
      assert Yahtzee.score(:sixes, [6, 6, 2, 2, 2]) == 12
    end
  end

  describe "score/2 - fives" do
    test "return 0" do
      assert Yahtzee.score(:fives, [6, 2, 3, 4, 1]) == 0
    end

    test "calculate" do
      assert Yahtzee.score(:fives, [5, 5, 5, 2, 2]) == 15
    end
  end

  describe "score/2 - fours" do
    test "return 0" do
      assert Yahtzee.score(:fours, [6, 2, 3, 2, 1]) == 0
    end

    test "calculate" do
      assert Yahtzee.score(:fours, [4, 4, 4, 2, 2]) == 12
    end
  end

  describe "score/2 - threes" do
    test "return 0" do
      assert Yahtzee.score(:threes, [6, 2, 4, 2, 1]) == 0
    end

    test "calculate" do
      assert Yahtzee.score(:threes, [3, 3, 3, 2, 2]) == 9
    end
  end

  describe "score/2 - twos" do
    test "return 0" do
      assert Yahtzee.score(:twos, [6, 1, 3, 4, 1]) == 0
    end

    test "calculate" do
      assert Yahtzee.score(:twos, [4, 4, 4, 2, 2]) == 4
    end
  end

  describe "score/2 - ones" do
    test "return 0" do
      assert Yahtzee.score(:ones, [6, 2, 3, 2, 2]) == 0
    end

    test "calculate" do
      assert Yahtzee.score(:ones, [4, 4, 4, 1, 1]) == 2
    end
  end

  describe "score/2 - pair" do
    test "return 0" do
      assert Yahtzee.score(:pair, [6, 2, 3, 4, 1]) == 0
    end

    test "calculate" do
      assert Yahtzee.score(:pair, [5, 5, 1, 2, 2]) == 10
    end
  end

  describe "score/2 - two_pairs" do
    test "return 0" do
      assert Yahtzee.score(:two_pairs, [3, 2, 3, 4, 1]) == 0
    end

    test "calculate" do
      assert Yahtzee.score(:two_pairs, [5, 5, 1, 2, 2]) == 14
    end
  end

  describe "score/2 - three_of_a_kind" do
    test "return 0" do
      assert Yahtzee.score(:three_of_a_kind, [3, 2, 3, 1, 1]) == 0
    end

    test "calculate" do
      assert Yahtzee.score(:three_of_a_kind, [5, 5, 5, 2, 2]) == 15
    end
  end

  describe "score/2 - four of a kind" do
    test "return 0" do
      assert Yahtzee.score(:four_of_a_kind, [3, 2, 3, 2, 1]) == 0
    end

    test "calculate" do
      assert Yahtzee.score(:four_of_a_kind, [1, 6, 6, 6, 6]) == 24
    end
  end

  describe "score/2 - small straight" do
    test "return 0" do
      assert Yahtzee.score(:small_straight, [3, 2, 3, 2, 1]) == 0
    end

    test "calculate" do
      assert Yahtzee.score(:small_straight, [1, 2, 3, 4, 5]) == 15
    end
  end

  describe "score/2 - large straight" do
    test "return 0" do
      assert Yahtzee.score(:large_straight, [1, 2, 3, 2, 1]) == 0
    end

    test "calculate" do
      assert Yahtzee.score(:large_straight, [2, 3, 4, 5, 6]) == 20
    end
  end

  describe "score/2 - full house" do
    test "return 0" do
      assert Yahtzee.score(:full_house, [6, 2, 3, 4, 1]) == 0
    end

    test "calculate" do
      assert Yahtzee.score(:full_house, [5, 5, 2, 2, 2]) == 16
    end
  end
end
