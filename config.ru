require 'rack/rewrite'

# Expects ENV['REDIRECTS'] to be a ruby hash of source hostnames to destination hostnames. E.g.:
REDIRECTS = { ENV.fetch('OLD_URL') => ENV.fetch('NEW_URL') }

use Rack::Rewrite do

  REDIRECTS.each do |from, to|
    r301 %r{.*}, "http://#{to}$&", if: -> (env) { env['SERVER_NAME'] == from }
  end

end

# Fall back to default app (empty).
run -> (env) { [200, {}, []] }
