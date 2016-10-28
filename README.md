# Setup
Clone the mars_rovers project into a directory on the same level as this project.

Also clone saschatimme/elm-phoenix as it's required by Elm

```
cd ..
git clone https://github.com/chazsconi/mars_rovers
git clone https://github.com/saschatimme/elm-phoenix.git
```

Start the server
`iex -S mix phoenix.server`

Visit http://localhost:4000

# Monitoring

Monitor traffic through websocket
```
sudo ngrep -d lo0 -q -W byline port 4000
```
