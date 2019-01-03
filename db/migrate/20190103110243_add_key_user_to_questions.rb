class AddKeyUserToQuestions < ActiveRecord::Migration[4.2]
	def change
		add_reference :questions, :user, foreign_key: true
	end
end