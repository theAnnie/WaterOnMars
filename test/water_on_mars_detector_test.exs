defmodule WaterOnMarsDetectorTest do
  use ExUnit.Case

  describe "calc/2" do
    test "scenario no 1" do
      input = [1, 5, 5, 3, 1, 2, 0, 4, 1, 1, 3, 2, 2, 3, 2, 4, 3, 0, 2, 3, 3, 2, 1, 0, 2, 4, 3]

      result = WaterOnMarsDetector.calc(input)

      assert result == ["(3, 3, score:26)"]
    end

    test "scenario no 2" do
      input = [3, 4, 2, 3, 2, 1, 4, 4, 2, 0, 3, 4, 1, 1, 2, 3, 4, 4]
      result = WaterOnMarsDetector.calc(input) |> IO.inspect()

      # assert result == ["(3, 3, score:26)"]
    end
  end
end
