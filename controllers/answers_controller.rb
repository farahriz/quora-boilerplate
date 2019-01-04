#show the form to make a new answer
get '/answers/new' do
	@last_question_id = nil || cookies[:last_question_id]
	erb :"answers/new"
end

#if making a new answer fails, throw this error message
get '/answers/failure' do
	erb :"error/problem"
end

post '/answers/new' do
	# byebug
	@answer = Answer.new(params[:answer])
	if @answer.save
		@answer.save
		cookies[:last_question_id] = nil #clear cookies
		redirect to "/answers/#{@answer.question_id}/view/#{@answer.id}" #needs to redirect to the specific answer
	else
		redirect to "/answers/failure"
	end
end

# Shows all answers for a given question ID
get '/answers/:question_id' do
	# => params[:id] returns the value input in the :wildcard path
	@answers = Answer.where(:question_id => params[:question_id])
    erb :"answers/index"
end

# Shows one specific answer
get '/answers/:question_id/view/:id' do
	@answer = Answer.find(params[:id])
	erb :"answers/show"
end




# Shows all answers for all questions, like a 'recently commented' section
get '/answers' do
	@answers = Answer.all
	erb :"answers/index"
end



# Edit one specific answer
get '/answers/:id/edit' do
	@answer = Answer.find(params[:id])
	erb :"answers/edit"

end

patch '/answers/:id/edit' do
	# byebug
	@answer = Answer.find(params[:id])
	@answer.update(params[:answer])
	@answer.save
	redirect to "/answers/#{@answer.question_id}/view/#{@answer.id}"
end



#NOT YET
# Delete one specific answer
get '/answers/:id/delete' do
	@answer = Answer.find(params[:id])
	erb :"answers/delete"
end

delete '/answers/:id/delete' do #delete action
  @answer = Answer.find(params[:id])
  @answer.delete
  redirect to '/answers'
end
