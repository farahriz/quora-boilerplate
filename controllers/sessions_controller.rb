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

get 'sessions/new' do
	erb :"login"
end

get 'sessions/delete' do
	erb :"logout"
end


post '/signup' do
  	@user = User.new(params[:user])
  	if @user.save
    	@user.save
    	redirect '/sessions/new'
  	else
  		redirect '/sessions/failure'
  	end
end  

post '/sessions/new' do
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


post '/sessions/delete' do
  # kill a session when a user chooses to logout, for example, assign nil to a session
	 # session[:user_id] = nil
	 sign_out

  # redirect to the appropriate page
  	redirect '/sessions/delete'

end