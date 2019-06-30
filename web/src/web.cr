require "kemal"
require "halite"
require "kave"

error 404 do |env|
  env.response.content_type = "application/json"
  { errors: [{code: 404}] }.to_json
end

public do
  get "/" do |env|
    {
      errors: [] of String,
      payload: {
        message: "this is a public route"
      }
    }.to_json
  end

  get "/pdf" do |env|
    Halite.get("http://localhost:8080")
  end
end

api("v1") do
  get "/users" do |env|
    [{id: 1, name: "Blah"}].to_json
  end
end

api("v2") do
  get "/users" do |env|
    [{id: 2, name: "Blah 2"}].to_json
  end
end

