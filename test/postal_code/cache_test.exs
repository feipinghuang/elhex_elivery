defmodule ElhexDelivery.PostalCode.CacheTest do
  use ExUnit.Case
  alias ElhexDelivery.PostalCode.Cache
  doctest ElhexDelivery

  test "get_and_set_distance" do
    p1 = "123"
    p2 = "456"
    distance = 789

    Cache.set_distance(p1, p2, distance)
    retrieved_distance = Cache.get_distance(p1, p2)

    assert retrieved_distance == distance
  end

end
