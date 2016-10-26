defmodule MarsRoversWeb.PlateauVisualiserWeb do
  use GenEvent
  require Logger

  def handle_event({:rover_moved, %MarsRovers.Rover{id: id, x: x, y: y, d: d}}, state) do
    # Only send required properties to browser
    MarsRoversWeb.Endpoint.broadcast! "plateau:public", "rover:update", %{id: id, x: x, y: y, d: d}
    {:ok, state}
  end
end
