Resque::Server.use(Rack::Auth::Basic)  do |user, password|
  user == 'admin' and password = 'admin'
end

