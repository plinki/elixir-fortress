defmodule Fortress.CLI do
  @moduledoc """
  Usage: fortress [options] <command> [args]
  Options:
  	 -h, --help                        Display this message
  	 -v, --version                     Print the version of the app
  Commands:
  """
  @switches [help: :boolean, version: :boolean]
  @aliases [h: :help, go: :start, v: :version]

  def main(argv) do
    argv
    |> parse_args
    |> process
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: @switches, aliases: @aliases)

    case parse do
      {[version: true], _, _} ->
        "0"

      {[help: true], _, _} ->
        :usage

      {flags, [command, arg], _} ->
        {[command, arg], flags}

      {flags, [command, arg1, arg2], _} ->
        {[command, arg1, arg2], flags}

      {flags, [command], _} ->
        {[command], flags}

      _ ->
        :usage
    end
  end

  def process({["h"], _options}), do: process({["help"], _options})
  def process({["help"], _options}), do: process(:usage)

  @doc """
  Prints out usage information
  """
  def process(:usage) do
    IO.puts(@moduledoc)
  end
end
