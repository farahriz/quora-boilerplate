class AddKeysToAnswers < ActiveRecord::Migration[4.2]
	def change
		add_reference :answers, :question, foreign_key: true
	end
end