get '/questions/new' do
	erb :"questions/new"
end

post '/questions/new' do
	@user = current_user
	@question = Question.create(:title => params[:title], :content => params[:content], :user_id => @user.id)
	redirect to "/questions/#{@question.id}"
end

get '/questions/:id' do
	# => params[:id] returns the value input in the :wildcard path
	@user = current_user
	@question = Question.find(params[:id])
    erb :"questions/show"
end




# The ones below here have not been implemented yet
	# get '/questions' do
	# 	# @questions = Question.all
	# 	erb :"questions/index"
	# end


	# get '/questions/:id/edit' do
	# 	@question = Question.find(params[:id])
	# 	erb :"questions/edit"

	# end

	# patch '/articles/:id' do
	# 	@question = Question.find(params[:id])
	# 	@question.title = params[:title]
	# 	@question.content = params[:content]
	# 	@question.save
	# 	redirect to "/questions/#{@question.id}"
	# end
