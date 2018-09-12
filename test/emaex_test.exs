defmodule EmaexTest do
  use ExUnit.Case

  test "ema calculate" do
		Emaex.calc(Enum.to_list(1..1000), 500)
  end
end
