defmodule Adventofcode.Day19TractorBeamTest do
  use Adventofcode.FancyCase

  import Adventofcode.Day19TractorBeam

  alias Adventofcode.Day19TractorBeam.Printer

  describe "part_1/1" do
    test_with_puzzle_input do
      assert 162 = puzzle_input() |> part_1()
    end
  end

  describe "Printer.print/1" do
    @expected """
    #.................................................
    ..................................................
    ..................................................
    ..................................................
    .....#............................................
    ......#...........................................
    .......#..........................................
    ........##........................................
    ..........#.......................................
    ...........#......................................
    ............##....................................
    .............##...................................
    ..............##..................................
    ...............###................................
    ................###...............................
    .................###..............................
    ...................###............................
    ....................###...........................
    .....................###..........................
    ......................####........................
    .......................####.......................
    ........................####......................
    .........................#####....................
    ..........................#####...................
    ............................####..................
    .............................#####................
    ..............................#####...............
    ...............................#####..............
    ................................######............
    .................................######...........
    ..................................######..........
    ...................................#######........
    .....................................######.......
    ......................................######......
    .......................................#######....
    ........................................#######...
    .........................................#######..
    ..........................................########
    ...........................................#######
    ............................................######
    ..............................................####
    ...............................................###
    ................................................##
    .................................................#
    ..................................................
    ..................................................
    ..................................................
    ..................................................
    ..................................................
    ..................................................
    """
    test_with_puzzle_input do
      assert String.trim_trailing(@expected, "\n") ==
               puzzle_input() |> part_1_grid() |> Printer.s_print()
    end
  end
end
