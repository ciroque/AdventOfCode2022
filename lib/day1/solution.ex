defmodule Day1.Solution do
  @moduledoc """
  Examples:

      iex> {:ok, _} = Day1.Solution.run()


  """

  def run do
    data = Support.FilerReader.read_file("day1.dat")

    IO.puts("\n>>>>>> #{__MODULE__}:: data(#{data})")

    {:not_implemented, %{}}
  end
end
