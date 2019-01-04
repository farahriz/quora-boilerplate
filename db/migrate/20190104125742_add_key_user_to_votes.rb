class AddKeyUserToVotes < ActiveRecord::Migration[4.2]
	def change
		add_reference :votes, :user, foreign_key: true
	end
end