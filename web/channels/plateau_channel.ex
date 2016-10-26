defmodule MarsRoversWeb.PlateauChannel do
  use Phoenix.Channel
  require Logger

  def join("plateau:public", message, socket) do
    Logger.info "join: #{inspect message}"
    {:ok, socket}
  end
  def join("plateau:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end
end
