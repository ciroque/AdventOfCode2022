defmodule Day4.Solution do
  @moduledoc """
  Examples:

      iex> {:ok, %{answer: nil}} = Day4.Solution.part_one()

      iex> {:ok, %{answer: nil}} = Day4.Solution.part_two()

  """

  def part_one do
    data = Support.FileReader.read_file("day4.dat")
    result = nil

    IO.puts("\n>>>>>> #{__MODULE__}:: result(#{result})")

    {:not_implemented, %{answer: nil}}
  end

  def part_two do
    data = Support.FileReader.read_file("day4.dat")
    result = nil

    IO.puts("\n>>>>>> #{__MODULE__}:: result(#{result})")

    {:not_implemented, %{answer: result}}
  end
end
