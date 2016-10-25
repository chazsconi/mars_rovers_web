# MarsRoversWeb

Push a rover update:
`MarsRoversWeb.Endpoint.broadcast! "plateau:public", "rover:update", %{x: 10, y: 20, d: "S", id: 1}`
