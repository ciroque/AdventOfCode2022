defmodule Support.SolutionTemplate do
  @moduledoc """
  Examples:

      iex> {:ok, _} = DayN.Solution.run()


  """

  def run do
    data = Support.FilerReader.read_file("dayN.dat")

    IO.puts("\n>>>>>> #{__MODULE__}:: data(#{data})")

    {:not_implemented, %{}}
  end
end
