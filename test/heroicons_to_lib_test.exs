defmodule HeroiconsToLibTest do
  use ExUnit.Case
  doctest HeroiconsToLib

  test "greets the world" do
    assert HeroiconsToLib.hello() == :world
  end
end
