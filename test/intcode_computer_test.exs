# test/intcode_computer_test.exs
defmodule Adventofcode.IntcodeComputerTest do
  use Adventofcode.FancyCase

  alias Adventofcode.IntcodeComputer.Program

  import Adventofcode.IntcodeComputer

  describe "parse/1" do
    test "parses 1,0,0,0,99" do
      assert %Program{addresses: %{0 => 1, 1 => 0, 2 => 0, 3 => 0, 4 => 99}} =
               "1,0,0,0,99" |> parse()
    end
  end

  describe "run/1" do
    test "1,0,0,0,99 becomes 2,0,0,0,99" do
      assert %Program{addresses: %{0 => 2, 1 => 0, 2 => 0, 3 => 0, 4 => 99}} =
               [1, 0, 0, 0, 99] |> parse() |> run()
    end

    test "2,3,0,3,99 becomes 2,3,0,6,99" do
      assert %Program{addresses: %{0 => 2, 1 => 3, 2 => 0, 3 => 6, 4 => 99}} =
               [2, 3, 0, 3, 99] |> parse() |> run()
    end

    test "2,4,4,5,99,0 becomes 2,4,4,5,99,9801" do
      assert %Program{addresses: %{0 => 2, 1 => 4, 2 => 4, 3 => 5, 4 => 99, 5 => 9801}} =
               [2, 4, 4, 5, 99, 0] |> parse() |> run()
    end

    test "1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99" do
      assert %Program{
               addresses: %{
                 0 => 30,
                 1 => 1,
                 2 => 1,
                 3 => 4,
                 4 => 2,
                 5 => 5,
                 6 => 6,
                 7 => 0,
                 8 => 99
               }
             } = [1, 1, 1, 4, 99, 5, 6, 0, 99] |> parse() |> run()
    end
  end
end
