app = proc do |env|
  [302, {'Content-Type' => 'text','Location' => ENV.fetch('REDIRECT_URL')}, ['302 found'] ]
end
run app
