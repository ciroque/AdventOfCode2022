defmodule Support.SolutionTemplate do
  @moduledoc """
  Examples:

      iex> {:ok, %{answer: nil}} = DayN.Solution.part_one()

      iex> {:ok, %{answer: nil}} = DayN.Solution.part_two()

  """

  def part_one do
    data = Support.FileReader.read_file("dayN.dat")

    IO.puts("\n>>>>>> #{__MODULE__}:: data(#{data})")

    {:not_implemented, %{}}
  end

  def part_two do
    data = Support.FileReader.read_file("dayN.dat")

    IO.puts("\n>>>>>> #{__MODULE__}:: data(#{data})")

    {:not_implemented, %{}}
  end
end
