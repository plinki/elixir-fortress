defmodule Fortress.MixProject do
  use Mix.Project

  def project do
    [
      app: :fortress,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      escript: [main_module: Fortress.CLI],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
	extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
	{:wallaby, "~> 0.20.0", [runtime: false, only: :test]}
    ]
  end
end
