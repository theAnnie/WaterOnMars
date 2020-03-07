defmodule WaterOnMarsDetector do
  def calc(grid) do
    [number_of_results | grid] = grid
    [size | grid] = grid

    array_indexes = prepare_array(size)

    array_indexes
    |> Enum.zip(grid)
    |> Enum.into(%{})
    |> do_calc({0, 0}, %{}, size |> IO.inspect(label: "size"))
  end

  defp prepare_array(n) do
    indexes =
      for a <- 0..(n - 1),
          do: for(b <- 0..(n - 1), do: {a, b})

    indexes |> Enum.flat_map(fn x -> x end)
  end

  defp do_calc(orginal_map, {x, y} = current, results, max) do
    if current == {max - 1, max - 1} do
      results = Map.put(results, current, sum_values_of_neighbours(current, orginal_map))
      results
    else
      results = Map.put(results, current, sum_values_of_neighbours(current, orginal_map))

      current =
        if y == max - 1 and x != max - 1 do
          {x + 1, 0}
        else
          {x, y + 1}
        end

      do_calc(orginal_map, current, results, max)
    end
  end

  defp sum_values_of_neighbours({x, y}, orginal_map) do
    n1 = orginal_map |> Map.get({x - 1, y - 1}, 0)
    n2 = orginal_map |> Map.get({x - 1, y}, 0)
    n3 = orginal_map |> Map.get({x - 1, y + 1}, 0)
    n4 = orginal_map |> Map.get({x, y - 1}, 0)
    n5 = orginal_map |> Map.get({x, y + 1}, 0)
    n6 = orginal_map |> Map.get({x + 1, y - 1}, 0)
    n7 = orginal_map |> Map.get({x + 1, y}, 0)
    n8 = orginal_map |> Map.get({x + 1, y + 1}, 0)

    curr_val = orginal_map |> Map.get({x, y})

    n1 + n2 + n3 + n4 + n5 + n6 + n7 + n8 + curr_val
  end
end
