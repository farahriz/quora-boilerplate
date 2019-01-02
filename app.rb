require_relative './config/init.rb'
set :run, true
enable :sessions


get '/' do
  @name = "Bob Smith"
  erb :"home"
end

get '/today' do
	@date = Date.today
	erb :"test/index"
end 

get '/signup' do
	erb :"signup"
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    user.save
  else
  	erb :"error/invalid_signup"
  end
end  



get '/login' do
	erb :"login"
end

get '/logout' do
	erb :"logout"
end


post '/login' do
  # apply a authentication method to check if a user has entered a valid email and password


  # if a user has successfully been authenticated, you can assign the current user id to a session

end


post '/logout' do
  # kill a session when a user chooses to logout, for example, assign nil to a session
  
  # redirect to the appropriate page

end


get '/users/:id' do
  # some code here to find the user with the id given and render the profile page containing the user's infomation
end