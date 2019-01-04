#view all votes for an answer
get '/votes' do
	@votes = Vote.all
	erb :"votes/index"
end


#create a vote
post '/votes/new' do
		byebug
		@vote = Vote.new(params[:vote])
		if @vote.save
			@vote.save
		else
			#redirect to an error message
		end

end

#remove a vote
post '/votes/delete' do
	
end