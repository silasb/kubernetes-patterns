require "./src/web.cr"

Kemal.config.port = ENV.fetch("PORT", "3000").to_i

Kave.configure do |c|
  # These are default config options
	c.format = :json                # see Formats below
  # c.auth_strategy = nil           # see Auth Strategy below
  # c.token_model = Kave::AuthToken # see Auth Strategy below
  # c.version_strategy = :header    # see Version Strategy below
end

Kemal.run
