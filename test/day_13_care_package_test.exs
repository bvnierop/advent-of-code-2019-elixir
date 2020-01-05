defmodule Adventofcode.Day13CarePackageTest do
  use Adventofcode.FancyCase

  alias Adventofcode.Day13CarePackage.{ArcadeCabinet, Printer}
  alias Adventofcode.IntcodeComputer

  import Adventofcode.Day13CarePackage

  describe "Tiles.put/3" do
    test "1,2,3 would draw a horizontal paddle tile (1 tile from the left and 2 tiles from the top)" do
      assert %ArcadeCabinet{tiles: %{{1, 2} => :horizontal_paddle}} =
               %ArcadeCabinet{} |> ArcadeCabinet.step([[1, 2, 3]])
    end

    test "6,5,4 would draw a ball tile (6 tiles from the left and 5 tiles from the top)" do
      assert %ArcadeCabinet{tiles: %{{6, 5} => :ball}} =
               %ArcadeCabinet{} |> ArcadeCabinet.step([[6, 5, 4]])
    end
  end

  describe "Printer.print/1" do
    @expected """
    ██████████████████████████████████████████████████████████████████████████████████████
    ██                                                                                  ██
    ██  ▒▒▒▒    ▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒▒    ▒▒  ▒▒▒▒▒▒  ▒▒▒▒  ▒▒  ██
    ██  ▒▒▒▒  ▒▒    ▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒    ▒▒▒▒            ▒▒▒▒▒▒    ▒▒▒▒    ▒▒▒▒  ▒▒▒▒  ██
    ██    ▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒  ▒▒▒▒      ▒▒▒▒▒▒  ▒▒    ▒▒▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ██
    ██  ▒▒▒▒      ▒▒▒▒  ▒▒▒▒      ▒▒▒▒▒▒  ▒▒  ▒▒  ▒▒  ▒▒  ▒▒▒▒▒▒    ▒▒      ▒▒    ▒▒▒▒  ██
    ██  ▒▒▒▒  ▒▒▒▒        ▒▒▒▒▒▒      ▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ▒▒        ▒▒▒▒  ▒▒      ██
    ██  ▒▒  ▒▒  ▒▒▒▒  ▒▒▒▒        ▒▒  ▒▒  ▒▒    ▒▒▒▒                ▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒  ██
    ██  ▒▒▒▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒  ▒▒▒▒▒▒  ▒▒  ▒▒▒▒    ▒▒  ██
    ██  ▒▒    ▒▒▒▒▒▒▒▒▒▒  ▒▒    ▒▒  ▒▒    ▒▒    ▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒    ▒▒  ██
    ██    ▒▒▒▒▒▒  ▒▒▒▒  ▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒      ▒▒  ▒▒    ▒▒  ▒▒▒▒▒▒▒▒  ██
    ██  ▒▒▒▒      ▒▒▒▒▒▒▒▒▒▒    ▒▒  ▒▒  ▒▒    ▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒  ▒▒  ▒▒  ▒▒▒▒▒▒  ▒▒▒▒  ██
    ██    ▒▒▒▒  ▒▒    ▒▒▒▒▒▒▒▒▒▒  ▒▒    ▒▒  ▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒          ▒▒  ▒▒  ▒▒    ██
    ██  ▒▒    ▒▒  ▒▒▒▒▒▒▒▒▒▒    ▒▒  ▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒      ▒▒    ▒▒▒▒  ▒▒      ██
    ██  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒  ▒▒    ▒▒    ▒▒▒▒▒▒▒▒▒▒  ▒▒    ▒▒  ▒▒    ▒▒    ▒▒  ▒▒▒▒▒▒▒▒▒▒  ██
    ██  ▒▒▒▒    ▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒    ▒▒  ▒▒▒▒  ▒▒▒▒▒▒  ▒▒▒▒▒▒  ▒▒  ▒▒▒▒  ██
    ██  ▒▒▒▒▒▒  ▒▒    ▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ██
    ██                                                                                  ██
    ██                                    🏐                                            ██
    ██                                                                                  ██
    ██                                                                                  ██
    ██                                        ▁▁                                        ██
    ██                                                                                  ██
    """
    test_with_puzzle_input do
      assert String.trim_trailing(@expected, "\n") ==
               puzzle_input()
               |> IntcodeComputer.parse()
               |> ArcadeCabinet.new()
               |> ArcadeCabinet.run()
               |> Printer.s_print()
    end
  end

  describe "part_1/1" do
    test_with_puzzle_input do
      assert 363 = puzzle_input() |> part_1()
    end
  end

  describe "part_2/1" do
    test_with_puzzle_input do
      assert 17159 = puzzle_input() |> part_2()
    end
  end
end
