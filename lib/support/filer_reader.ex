defmodule Support.FilerReader do
  @moduledoc false

  @spec read_file(String.t()) :: String.t()
  def read_file(filename) do
    path = get_private_filename(filename)
    File.read!(path)
  end

  def read_into_lines(filename) do
    path = get_private_filename(filename)
    File.stream!(path)
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
  end

  defp get_private_filename(filename) do
    Path.join(:code.priv_dir(:adventofcode2022), filename)
  end
end
