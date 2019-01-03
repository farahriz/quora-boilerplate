get '/questions/new' do
	erb :"questions/new"
end

get '/questions/failure' do
	erb :"error/problem"
end

post '/questions/new' do
	# @user = current_user
	@question = Question.new(params[:question])
	if @question.save
		@question.save
		redirect to "/questions/#{@question.id}"
	else
		redirect to "/questions/failure"
	end
end

get '/questions/:id' do
	# => params[:id] returns the value input in the :wildcard path
	@question = Question.find(params[:id])
    erb :"questions/show"
end




# The ones below here have not been implemented yet
	get '/questions' do
		@questions = Question.all
		erb :"questions/index"
	end


	get '/questions/:id/edit' do
		@question = Question.find(params[:id])
		erb :"questions/edit"

	end

	# patch '/questions/:id' do
	# 	@question = Question.find(params[:id])
	# 	@question.title = params[:title]
	# 	@question.content = params[:content]
	# 	@question.save
	# 	redirect to "/questions/#{@question.id}"
	# end
