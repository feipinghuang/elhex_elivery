defmodule ElhexDelivery.PostalCode.StoreTest do
  use ExUnit.Case
  alias ElhexDelivery.PostalCode.Store
  doctest ElhexDelivery

  test "get_geolacation" do
    {latitude, longtitude} = Store.get_geolacation("94062")
    assert is_float(latitude)
    assert is_float(longtitude)
  end

end
