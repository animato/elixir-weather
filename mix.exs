defmodule Weather.MixProject do
  use Mix.Project

  def project do
    [
      app: :weather,
      escript: escript_config(),
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      name: "Weather",
      source_url: "https://github.com/animato/elixir-weather",
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :xmerl]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 2.0"},
      {:ex_doc,"~> 0.25"},
      {:earmark, "~> 1.4"},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp escript_config do
    [
      main_module: Weather.Cli
    ]
  end
end
