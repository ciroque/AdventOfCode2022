defmodule Day4.Solution do
  @moduledoc """
  Examples:

      iex> {:ok, %{answer: 466}} = Day4.Solution.part_one()

      iex> {:ok, %{answer: 865}} = Day4.Solution.part_two()

  """

  def part_one do
    result = solve(&test_complete_overlap/1)

    {:ok, %{answer: result}}
  end

  def part_two do
    result = solve(&test_partial_overlap/1)

    {:ok, %{answer: result}}
  end

  defp solve(test_function) do
    data = Support.FileReader.read_into_lines("day4.dat")

    data
    |> parse_pairs()
    |> parse_sections()
    |> find_overlaps(test_function)
    |> length()
  end

  defp find_overlaps(assignments, test_function) do
    Enum.filter(assignments, test_function)
  end

  defp parse_pairs(data), do: Enum.map(data, &String.split(&1, ","))

  defp parse_sections(pairs), do: Enum.map(pairs, &parse_section/1)

  defp parse_section(sections), do: Enum.map(sections, &parse_areas/1)

  defp parse_areas(area) do
    [lower, upper] = String.split(area, "-")

    [
      String.to_integer(lower),
      String.to_integer(upper)
    ]
  end

  defp test_complete_overlap([[left_lower, left_upper], [right_lower, right_upper]] = _assignment) do
    (left_lower >= right_lower and left_upper <= right_upper)
    or
    (right_lower >= left_lower and right_upper <= left_upper)
  end

  defp test_partial_overlap([[left_lower, left_upper], [right_lower, right_upper]] = _assignment) do
    (left_lower >= right_lower and left_lower <= right_upper)
    or
    (right_lower >= left_lower and right_lower <= left_upper)
  end
end
