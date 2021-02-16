defmodule RabbitTestTest do
  use ExUnit.Case
  doctest RabbitTest

  test "greets the world" do
    assert RabbitTest.hello() == :world
  end
end
