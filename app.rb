require_relative './config/init.rb'
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

get '/success' do
	@user = User.find(session[:user_id])
	erb :"greetings"
end

get '/failure' do
	erb :"error/invalid_signup"
end

get '/users/:id' do
  # some code here to find the user with the id given and render the profile page containing the user's infomation
end

get '/signup' do
	erb :"signup"
end

get '/login' do
	erb :"login"
end

get '/logout' do
	erb :"logout"
end



post '/signup' do
  	@user = User.new(params[:user])
  	if @user.save
    	@user.save
    	redirect '/login'
  	else
  		redirect '/failure'
  	end
end  





post '/login' do
  # apply a authentication method to check if a user has entered a valid email and password
	@user = User.find_by(:email => params[:email])
  # if a user has successfully been authenticated, you can assign the current user id to a session
	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect '/success'
	else
		redirect '/failure'
	end


end


post '/logout' do
  # kill a session when a user chooses to logout, for example, assign nil to a session
  session[:user_id] = nil

  # redirect to the appropriate page
  redirect '/logout'

end

