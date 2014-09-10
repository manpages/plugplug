defmodule Unplug.Mixfile do
  use Mix.Project

  def project do
    [app: :unplug,
     version: "0.0.1",
     elixir: "~> 0.15.2-dev",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [ {:jsex,   ">= 2.0.0"},
      {:plug,   "~> 0.6.0"}, 
      {:cowboy, ">= 1.0.0"}, 
    ]
  end
end
