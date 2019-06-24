require "kemal"
require "halite"

get "/" do |env|
  "this is a public route"
end

get "/pdf" do |env|
  Halite.get("http://localhost:8080")
end

Kemal.run
