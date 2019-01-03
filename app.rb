require_relative './config/init.rb'
require_relative './helpers/user.rb'

set :run, true
set :session_secret, "beacon"
enable :sessions


get '/' do
  @name = "Bob Smith"
  erb :"home"
end

# get '/today' do
# 	@date = Date.today
# 	erb :"test/index"
# end 

get '/users/:id' do
  # some code here to find the user with the id given and render the profile page containing the user's infomation
end




