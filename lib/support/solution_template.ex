defmodule Support.SolutionTemplate do
  @moduledoc """
  Examples:

      iex> {:ok, %{answer: nil}} = DayN.Solution.part_one()

      iex> {:ok, %{answer: nil}} = DayN.Solution.part_two()

  """

  def part_one do
    data = Support.FileReader.read_file("dayN.dat")
    result = nil

    IO.puts("\n>>>>>> #{__MODULE__}:: result(#{result})")

    {:not_implemented, %{answer: result}}
  end

  def part_two do
    data = Support.FileReader.read_file("dayN.dat")
    result = nil

    IO.puts("\n>>>>>> #{__MODULE__}:: result(#{data})")

    {:not_implemented, %{answer: result}}
  end
end
