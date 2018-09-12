defmodule Emaex do
  @moduledoc """
    calculate for ema.
  """

	@type t :: %Emaex{times: integer, v: [float]}
  defstruct times: 0, v: []

  @spec calc([number()], any()) :: {:error, :empty} | {:ok, Emaex.t()}
  def calc(data, times), do: run(data, times)

  defp run(data, times, resp \\ [])
  defp run([], _times, []), do: {:error, :empty}
  defp run([], times, resp), do: {:ok, %Emaex{times: times, v: resp}}
  defp run([h | t], times, []), do: run(t, times, [h / 1])

  defp run([h | t], times, resp) do
    [pre_average] = Enum.take(resp, -1)
    new_weight = 2 / (times + 1)
    new_average = h * new_weight + pre_average * (1 - new_weight)
    run(t, times, resp ++ [new_average])
  end
end
