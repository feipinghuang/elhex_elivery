defmodule ElhexDelivery.PostalCode.NavigatorTest do
  use ExUnit.Case
  alias ElhexDelivery.PostalCode.Navigator
  doctest ElhexDelivery

  describe "get_distance" do
    test "postal code strings" do
      distance = Navigator.get_distance("94062", "94104")
      assert is_float(distance)
    end
    test "postal code integers" do
      distance = Navigator.get_distance(94062, 94104)
      assert is_float(distance)
    end
    test "postal code mixed strings and integers" do
      distance = Navigator.get_distance(94062, "94104")
      assert is_float(distance)
    end
    @tag :capture_log
    test "postal code unexpected format" do
      navigator_pid = Process.whereis(:postal_code_navigator)
      refrence = Process.monitor(navigator_pid)
      catch_exit do
        Navigator.get_distance(94062.22, "94104")
      end
      assert_received({:DOWN, ^refrence, :process, ^navigator_pid, {%ArgumentError{}, _}})
    end
  end
end
