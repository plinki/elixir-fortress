defmodule FortressTest do
  use ExUnit.Case
  doctest Fortress

  test "greets the world" do
    assert Fortress.hello() == :world
  end
end
