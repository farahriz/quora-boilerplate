
get 'questions' do
	@questions = Question.all
	erb :"questions/index"
end


get '/questions/:id' do
	# => params[:id] returns the value input in the :wildcard path
	@question = Question.find(params[:id])
    erb :"questions/show"
end

get '/questions/new' do
	@question = Question.create(:title => params[:title], :content => params[:content])
	redirect to "/questions/#{@question.id}"
end

get '/questions/:id/edit' do
	@question = Question.find_by_id(params[:id])
	erb :"questions/edit"

end

patch '/articles/:id' do
	@question = Question.find_by_id(params[:id])
	@question.title = params[:title]
	@question.content = params[:content]
	@question.save
	redirect to "/questions/#{@question.id}"
end
