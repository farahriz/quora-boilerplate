get '/answers/new' do
	erb :"answers/new"
end

get '/answers/failure' do
	erb :"error/problem"
end

post '/answers/new' do
	@answer = Answer.new(params[:answer])
	if @answer.save
		@answer.save
		redirect to "/answers/#{@answer.id}"
	else
		redirect to "/answers/failure"
	end
end

get '/answers/:id' do
	# => params[:id] returns the value input in the :wildcard path
	@answer = Answer.find(params[:id])
    erb :"answers/show"
end



get '/answers' do
	@answers = Answer.all
	erb :"answers/index"
end


get '/answers/:id/edit' do
	@answer = Answer.find(params[:id])
	erb :"answers/edit"

end

patch '/answers/:id/edit' do
	# byebug
	@answer = Answer.find(params[:id])
	@answer.update(params[:answer])
	@answer.save
	redirect to "/answers/#{@answer.id}"
end

get '/answers/:id/delete' do
	@answer = Answer.find(params[:id])
	erb :"answers/delete"
end

delete '/answers/:id/delete' do #delete action
  @answer = Answer.find(params[:id])
  @answer.delete
  redirect to '/answers'
end
