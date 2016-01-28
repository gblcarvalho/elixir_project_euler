defmodule ProjectEuler do
  use Application

  def start(_type, _args) do
  end

  def main(_args) do
    ProjectEuler.Main.main
  end
end
