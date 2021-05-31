defmodule ExampleSystem.Mixfile do
  use Mix.Project

  def project do
    [
      app: :example_system,
      version: "0.0.1",
      elixir: "~> 1.11",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preferred_cli_env: [release: :prod, upgrade: :prod],
      aliases: [
        release: ["example_system.build_assets", "phx.digest", "release"],
        upgrade: "example_system.upgrade"
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {ExampleSystem.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5"},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix_html, "~> 2.14"},
      {:ecto, "~> 3.6"},
      {:phoenix_ecto, "~> 4.2"},
      {:phoenix_live_reload, "~> 1.3", only: :dev},
      {:gettext, "~> 0.18"},
      {:plug_cowboy, "~> 2.5"},
      {:plug, "~> 1.11"},
      {:recon, "~> 2.5"},
      {:distillery, "~> 2.1"},
      {:jason, "~> 1.2"},
      {:swarm, "~> 3.4"},
      {:load_control, path: "../load_control"},
      {:phoenix_live_view, "~> 0.15"},
      {:parent, "~> 0.12"},
      {:stream_data, "~> 0.5", only: :test},
      {:assertions, "~> 0.18", only: :test}
    ]
  end
end
