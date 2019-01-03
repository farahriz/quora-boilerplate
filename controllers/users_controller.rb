# get "/profile" do
# end

# get "users"
# end

get '/users/:id' do
  # some code here to find the user with the id given and render the profile page containing the user's infomation
  # @user = User.find_by(:id)
  erb :"users/profile"
  # "Hello #{params['id']}!"

end

# get "users/:id/edit"
# end

# put "users/:id"
# end