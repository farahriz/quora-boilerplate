get '/questions/new' do
	erb :"questions/new"
end

get '/questions/failure' do
	erb :"error/problem"
end

post '/questions/new' do
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

post '/questions/:id' do
	cookies[:last_question_id] = params[:id]
	redirect '/answers/new'
end


get '/questions' do
	@questions = Question.all
	erb :"questions/index"
end


get '/questions/:id/edit' do
	@question = Question.find(params[:id])
	erb :"questions/edit"

end

patch '/questions/:id/edit' do
	# byebug
	@question = Question.find(params[:id])
	@question.update(params[:question])
	@question.save
	redirect to "/questions/#{@question.id}"
end

get '/questions/:id/delete' do
	@question = Question.find(params[:id])
	erb :"questions/delete"
end

delete '/questions/:id/delete' do #delete action
  @question = Question.find(params[:id])
  @question.delete
  redirect to '/questions'
end
