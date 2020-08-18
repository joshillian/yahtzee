defmodule YahtzeeTest do
  use ExUnit.Case
 # doctest Yahtzee

  describe "chance" do
    test "not" do
      assert Yahtzee.score(:chance, [])  == 0
    end

    test "is" do
      assert Yahtzee.score(:chance, [5,3,1,2,2])  == 13
    end
  end

  describe "yahtzee" do
    test "not" do
      assert Yahtzee.score(:yahtzee, [6,1,2,3,4]) == 0
    end

    test "all 6s" do
      assert Yahtzee.score(:yahtzee, [6,6,6,6,6]) == 50
    end
    test "all 5s" do
      assert Yahtzee.score(:yahtzee, [5,5,5,5,5]) == 50
    end
    test "all 4s" do
      assert Yahtzee.score(:yahtzee, [4,4,4,4,4]) == 50
    end
    test "all 3s" do
      assert Yahtzee.score(:yahtzee, [3,3,3,3,3]) == 50
    end
    test "all 2s" do
      assert Yahtzee.score(:yahtzee, [2,2,2,2,2]) == 50
    end
    test "all 1s" do
      assert Yahtzee.score(:yahtzee, [1,1,1,1,1]) == 50
    end
  end

  describe "sixes" do
    test "not" do
      assert Yahtzee.score(:sixes, [5,2,3,4,1])  == 0
    end

    test "is" do
      assert Yahtzee.score(:sixes, [6,6,2,2,2])  == 12
    end
  end

  describe "fives" do
    test "not" do
      assert Yahtzee.score(:fives, [6,2,3,4,1])  == 0
    end

    test "is" do
      assert Yahtzee.score(:fives, [5,5,5,2,2])  == 15
    end
  end

  describe "fours" do
    test "not" do
      assert Yahtzee.score(:fours, [6,2,3,2,1])  == 0
    end

    test "is" do
      assert Yahtzee.score(:fours, [4,4,4,2,2])  == 15
    end
  end

  describe "threes" do
    test "not" do
      assert Yahtzee.score(:threes, [6,2,4,2,1])  == 0
    end

    test "is" do
      assert Yahtzee.score(:threes, [3,3,3,2,2])  == 12
    end
  end

  describe "twos" do
    test "not" do
      assert Yahtzee.score(:twos, [6,1,3,4,1])  == 0
    end

    test "is" do
      assert Yahtzee.score(:twos, [4,4,4,2,2])  == 4
    end
  end

  describe "ones" do
    test "not" do
      assert Yahtzee.score(:ones, [6,2,3,2,2])  == 0
    end

    test "is" do
      assert Yahtzee.score(:ones, [4,4,4,1,1])  == 2
    end
  end

  describe "pair" do
    test "not" do
      assert Yahtzee.score(:pairs, [6,2,3,4,1])  == 0
    end

    test "is" do
      assert Yahtzee.score(:pairs, [5,5,1,2,2])  == 10
    end
  end

  describe "two pairs" do
    test "not" do
      assert Yahtzee.score(:two_pairs, [3,2,3,4,1])  == 0
    end

    test "is" do
      assert Yahtzee.score(:two_pairs, [5,5,1,2,2])  == 14
    end
  end

  describe "three of a kind" do
    test "not" do
      assert Yahtzee.score(:three_of_a_kind, [3,2,3,1,1])  == 0
    end

    test "is" do
      assert Yahtzee.score(:three_of_a_kind, [5,5,5,2,2])  == 15
    end
  end

  describe "four of a kind" do
    test "not" do
      assert Yahtzee.score(:four_of_a_kind, [3,2,3,2,1])  == 0
    end

    test "is" do
      assert Yahtzee.score(:four_of_a_kind, [1,6,6,6,6])  == 24
    end
  end

  describe "small straight" do
    test "not" do
      assert Yahtzee.score(:small_straight, [3,2,3,2,1])  == 0
    end

    test "is" do
      assert Yahtzee.score(:small_straight, [1,2,3,4,5])  == 15
    end
  end

  describe "large straight" do
    test "not" do
      assert Yahtzee.score(:large_straight, [1,2,3,2,1])  == 0
    end

    test "is" do
      assert Yahtzee.score(:large_straight, [2,3,4,5,6])  == 20
    end
  end

  describe "full house" do
    test "not" do
      assert Yahtzee.score(:full_house, [6,2,3,4,1])  == 0
    end

    test "is" do
      assert Yahtzee.score(:full_house, [5,5,2,2,2])  == 16
    end
  end




end
