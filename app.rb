require_relative './config/init.rb'
require_relative './helpers/user.rb'

set :run, true
set :session_secret, "beacon"
enable :sessions


get '/' do
  @name = "Bob Smith"
  @email = current_user.email
  erb :"home"
end

# get '/today' do
# 	@date = Date.today
# 	erb :"test/index"
# end 




