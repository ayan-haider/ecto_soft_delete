defmodule EctoSoftDelete.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ecto_soft_delete,
      version: "0.2.0",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:ecto, "~> 2.2.0"},
      {:postgrex, "~> 0.13", only: [:test]},
      {:ex_doc, "~> 0.16", only: [:dev, :test]},
      {:credo, "~> 0.8", only: [:dev, :test]},
      {:excoveralls, "~> 0.7", only: [:dev, :test]}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE", "CHANGELOG.md"],
      maintainers: ["Bryan Joseph", "Luke Ledet"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/revelrylabs/ecto_soft_delete"
      },
      build_tools: ["mix"]
    ]
  end
end