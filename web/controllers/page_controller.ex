defmodule MarsRoversWeb.PageController do
  use MarsRoversWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
