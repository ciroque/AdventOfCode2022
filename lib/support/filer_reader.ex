defmodule Support.FilerReader do
  @moduledoc false

  @spec read_file(String.t()) :: String.t()
  def read_file(filename) do
    path = Path.join(:code.priv_dir(:adventofcode2022), filename)
    File.read!(path)
  end
end
