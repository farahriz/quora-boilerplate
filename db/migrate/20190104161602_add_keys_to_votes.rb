class AddKeysToVotes < ActiveRecord::Migration[4.2]
	def change
		add_reference :votes, :answer, foreign_key: true, null: true
		add_reference :votes, :question, foreign_key: true, null: true
	end
end