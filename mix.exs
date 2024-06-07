defmodule HeroiconsToLib.MixProject do
  use Mix.Project

  def project do
    [
      app: :heroicons_to_lib,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
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
      {:sweet_xml, "~> 0.7.4"},
      {:elixir_xml_to_map, "~> 3.1"}
    ]
  end
end
