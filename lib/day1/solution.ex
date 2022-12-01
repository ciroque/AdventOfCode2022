defmodule Day1.Solution do
  @moduledoc """
  Examples:

      iex> {:ok, %{answer: 64929}} = Day1.Solution.part_one()

      iex> {:ok, %{answer: 193697}} = Day1.Solution.part_two()

  """

  def part_one do
    data = Support.FileReader.read_into_lines("day1.dat")
    elves_calories = sorted_elves_calories(data)
    most_calories = Enum.at(elves_calories, 0, :none)

    {:ok, %{answer: most_calories}}
  end

  def part_two do
    data = Support.FileReader.read_into_lines("day1.dat")
    elves_calories = sorted_elves_calories(data)
    top_three_calories = elves_calories
    |> Enum.take(3)
    |> Enum.sum()

    {:ok, %{answer: top_three_calories}}
  end

  defp sorted_elves_calories(data) do
    data
    |> Stream.chunk_by(&(&1 == ""))
    |> Stream.reject(&(&1 == [""]))
    |> Stream.map(&sum_list/1)
    |> Enum.sort(:desc)
  end

  defp sum_list(list) do
    integers = Enum.map(list, &String.to_integer/1)
    Enum.sum(integers)
  end
end
