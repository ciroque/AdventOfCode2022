defmodule Day2.Solution do
  @moduledoc """
  Examples:

      iex> {:ok, %{answer: 12458}} = Day2.Solution.part_one()

      iex> {:ok, %{answer: 12683}} = Day2.Solution.part_two()

  """

  @win_points 6
  @lose_points 0
  @draw_points 3

  @rock_points 1
  @paper_points 2
  @scissors_points 3

  def part_one do
    data = Support.FileReader.read_into_lines("day2.dat")

    points =
      data
      |> Enum.map(&parse_line/1)
      |> determine_round_winners()
      |> calculate_player_total(:player_one)

    {:ok, %{answer: points}}
  end

  def part_two do
    data = Support.FileReader.read_into_lines("day2.dat")

    points =
      data
      |> Enum.map(&parse_line_coded/1)
      |> determine_round_winners()
      |> calculate_player_total(:player_one)

    {:ok, %{answer: points}}
  end

  defp calculate_player_total(rounds, player) do
    pts =
      rounds
      |> Stream.map(&Map.get(&1, player))
      |> Stream.map(&Map.get(&1, :points))
      |> Enum.sum()

    pts
  end

  defp determine_round_winners(rounds) do
    rounds
    |> Enum.map(&determine_round_winner/1)
  end

  # this is pretty awful, I really followed Github's Co-Pilot for parts of this, blech....
  defp determine_round_winner(round) do
    case round do
      %{player_one: %{implement: :rock}, player_two: %{implement: :scissors}} ->
        %{
          player_one: %{implement: :rock, points: @win_points + @rock_points},
          player_two: %{implement: :scissors, points: @lose_points + @scissors_points}
        }

      %{player_one: %{implement: :paper}, player_two: %{implement: :rock}} ->
        %{
          player_one: %{implement: :paper, points: @win_points + @paper_points},
          player_two: %{implement: :rock, points: @lose_points + @rock_points}
        }

      %{player_one: %{implement: :scissors}, player_two: %{implement: :paper}} ->
        %{
          player_one: %{implement: :scissors, points: @win_points + @scissors_points},
          player_two: %{implement: :paper, points: @lose_points + @paper_points}
        }

      %{player_one: %{implement: :rock}, player_two: %{implement: :rock}} ->
        %{
          player_one: %{implement: :rock, points: @draw_points + @rock_points},
          player_two: %{implement: :rock, points: @draw_points + @rock_points}
        }

      %{player_one: %{implement: :paper}, player_two: %{implement: :paper}} ->
        %{
          player_one: %{implement: :paper, points: @draw_points + @paper_points},
          player_two: %{implement: :paper, points: @draw_points + @paper_points}
        }

      %{player_one: %{implement: :scissors}, player_two: %{implement: :scissors}} ->
        %{
          player_one: %{implement: :scissors, points: @draw_points + @scissors_points},
          player_two: %{implement: :scissors, points: @draw_points + @scissors_points}
        }

      %{player_one: %{implement: :rock}, player_two: %{implement: :paper}} ->
        %{
          player_one: %{implement: :rock, points: @lose_points + @rock_points},
          player_two: %{implement: :paper, points: @win_points + @paper_points}
        }

      %{player_one: %{implement: :paper}, player_two: %{implement: :scissors}} ->
        %{
          player_one: %{implement: :paper, points: @lose_points + @paper_points},
          player_two: %{implement: :scissors, points: @win_points + @scissors_points}
        }

      %{player_one: %{implement: :scissors}, player_two: %{implement: :rock}} ->
        %{
          player_one: %{implement: :scissors, points: @lose_points + @scissors_points},
          player_two: %{implement: :rock, points: @win_points + @rock_points}
        }
    end
  end

  "You are player_one, Ready Player One?"

  defp parse_line(line) do
    [player_two_choice, player_one_choice] = String.split(line, " ")

    %{
      player_two: %{
        implement: map_to_implement(player_two_choice)
      },
      player_one: %{
        implement: map_to_implement(player_one_choice)
      }
    }
  end

  defp parse_line_coded(line) do
    [player_two_choice, player_one_choice] = String.split(line, " ")

    %{
      player_two: %{
        implement: map_to_implement(player_two_choice)
      },
      player_one: %{
        implement: map_to_coded(player_two_choice, player_one_choice)
      }
    }
  end

  defp map_to_coded(player_two_choice, player_one_choice) do
    case map_to_implement(player_two_choice) do
      :rock ->
        case player_one_choice do
          "X" -> :scissors
          "Y" -> :rock
          "Z" -> :paper
        end

      :paper ->
        case player_one_choice do
          "X" -> :rock
          "Y" -> :paper
          "Z" -> :scissors
        end

      :scissors ->
        case player_one_choice do
          "X" -> :paper
          "Y" -> :scissors
          "Z" -> :rock
        end
    end
  end

  defp map_to_implement(code) do
    case code do
      "A" -> :rock
      "X" -> :rock
      "B" -> :paper
      "Y" -> :paper
      "C" -> :scissors
      "Z" -> :scissors
    end
  end
end
