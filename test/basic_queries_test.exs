defmodule BasicQueriesTest do
  use ExUnit.Case
  doctest BasicQueries

  test "" do
    assert BasicQueries.hello() == :world
  end
end
