defmodule MarsRoversWeb.PlateauVisualiserWeb do
  use GenEvent
  require Logger

  def handle_event({:rover_moved, rover_state}, state) do
    MarsRoversWeb.Endpoint.broadcast! "plateau:public", "rover:update", rover_state
    {:ok, state}
  end
end
