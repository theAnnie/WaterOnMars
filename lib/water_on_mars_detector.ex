defmodule WaterOnMarsDetector do
  def calc(grid) do
    [number_of_results | grid] = grid
    [size | grid] = grid

    array_indexes = prepare_array(size)

    array_indexes
    |> Enum.zip(grid)
    |> Enum.into(%{})
  end

  def prepare_array(n) do
    indexes =
      for a <- 0..n,
          do: for(b <- 0..n, do: {a, b})

    indexes |> Enum.flat_map(fn x -> x end)
  end
end
