#view all votes for an answer
get '/votes' do
	@votes = Vote.all
	erb :"votes/index"
end


#create a vote
post '/votes/new' do
		@vote = Vote.new(params[:vote])
		if @vote.save
			@vote.save
		else
			p "There was an error"
		end

end


#edit a vote
get '/votes/:id/edit' do
	@vote = Vote.find(params[:id])
	erb :"votes/edit"

end

patch '/votes/:id/edit' do
	# byebug
	@vote = Vote.find(params[:id])
	@vote.update(params[:vote])
	@vote.save
	redirect to "/votes"
end


#remove a vote
get '/votes/:id/delete' do
	@vote = Vote.find(params[:id])
	erb :"votes/delete"
end


delete '/votes/:id/delete' do
	@vote = Vote.find(params[:id])
	@vote.delete
	redirect to '/votes'
end