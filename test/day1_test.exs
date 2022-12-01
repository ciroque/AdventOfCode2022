defmodule Day1.SolutionTest do
  use ExUnit.Case

  alias Day1.Solution

  @moduletag :capture_log

  doctest Solution

  test "module exists" do
    assert is_list(Solution.module_info())
  end
end
