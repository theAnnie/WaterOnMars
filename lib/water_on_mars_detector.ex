defmodule WaterOnMarsDetector do
  def calc(input) do
    [number_of_results | input] = input
    [size | input] = input

    size
    |> prepare_array(input)
    |> do_calc({0, 0}, %{}, size - 1)
    |> get_results(number_of_results)
  end

  defp prepare_array(n, grid) do
    indexes =
      for a <- 0..(n - 1),
          do: for(b <- 0..(n - 1), do: {a, b})

    indexes
    |> Enum.flat_map(fn x -> x end)
    |> Enum.sort_by(&elem(&1, 1))
    |> Enum.zip(grid)
    |> Enum.into(%{})  
  end

  defp do_calc(orginal_map, {_x, _y} = current, results, max) do
    results = Map.put(results, current, sum_values_of_neighbours(current, orginal_map))

    if current == {max, max} do
      results
    else
      case current do
        {^max, y} -> do_calc(orginal_map, {0, y + 1}, results, max)
        {x, y} -> do_calc(orginal_map, {x + 1, y}, results, max)
      end
    end
  end

  defp get_results(results, number_of_results) do
    results
    |> Map.to_list()
    |> Enum.sort_by(&elem(&1, 1))
    |> Enum.reverse()
    |> Enum.take(number_of_results)
    |> Enum.map(fn {{x, y}, value} -> "(#{x}, #{y}, score:#{value})" end)
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
