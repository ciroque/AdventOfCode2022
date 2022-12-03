defmodule Day3.Solution do
  @moduledoc """
  Examples:

      iex> {:ok, %{answer: 8349}} = Day3.Solution.part_one()

      iex> {:ok, %{answer: 2681}} = Day3.Solution.part_two()

  """

  def part_one do
    rucksacks = Support.FileReader.read_into_lines("day3.dat")
    result = rucksacks
    |> load_into_rucksack()
    |> find_common_items_across_rucksacks()
    |> calculate_priorities()
    |> Enum.sum()

    {:ok, %{answer: result}}
  end

  def part_two do
    data = Support.FileReader.read_into_lines("day3.dat")

    result = data
    |> group_into_threes()
    |> find_common_items_across_groups()
    |> calculate_priorities()
    |> Enum.sum()

    {:ok, %{answer: result}}

    {:ok, %{answer: result}}
  end

  defp calculate_priorities(items) do
    priority_map = priority_map()
    Enum.map(items, &(Map.get(priority_map, &1, 0)))
  end

  defp find_common_items_across_groups(groups), do: Enum.map(groups, &find_common_items_in_group/1)

  defp find_common_items_across_rucksacks(rucksacks), do: Enum.map(rucksacks, &find_common_items_in_rucksack/1)

  defp find_common_items_in_group([rucksack_one, rucksack_two, rucksack_three] = _group) do

    rucksack_one_list = split_string(rucksack_one)
    rucksack_two_list = split_string(rucksack_two)
    rucksack_three_list = split_string(rucksack_three)

    rucksack_one_ms = MapSet.new(rucksack_one_list)
    rucksack_two_ms = MapSet.new(rucksack_two_list)
    rucksack_three_ms = MapSet.new(rucksack_three_list)

    rucksack_one_two_intersection = MapSet.intersection(rucksack_one_ms, rucksack_two_ms)
    final_intersection = MapSet.intersection(rucksack_one_two_intersection, rucksack_three_ms)
    [common_item|_] = MapSet.to_list(final_intersection)

    common_item
  end

  defp find_common_items_in_rucksack({compartment_one, compartment_two} = _rucksack) do
    compartment_one_list = split_string(compartment_one)
    compartment_two_list = split_string(compartment_two)
    intersection = MapSet.intersection(MapSet.new(compartment_one_list), MapSet.new(compartment_two_list))

    [priority | _] = MapSet.to_list(intersection)

    priority
  end

  defp group_into_threes(data), do: Enum.chunk_every(data, 3)

  defp load_into_rucksack(data), do: Enum.map(data, &split_into_compartments/1)

  def priority_map do
    split_string("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    |> Enum.with_index(1)
    |> Enum.into(%{})
  end

  defp split_into_compartments(data), do: String.split_at(data, div(String.length(data), 2))

  defp split_string(string), do: String.split(string, "", trim: true)
end
