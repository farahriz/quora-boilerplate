get '/sessions/success' do
	# @user = User.find(session[:user_id])
	@user = current_user
	erb :"greetings"
end

get '/sessions/failure' do
	erb :"error/invalid_signup"
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
		sign_in(@user)
		redirect 'sessions/success'
	else
		redirect 'sessions/failure'
	end


end


post '/logout' do
  # kill a session when a user chooses to logout, for example, assign nil to a session
	 # session[:user_id] = nil
	 sign_out

  # redirect to the appropriate page
  	redirect '/logout'

end