class CreateTableAnswers < ActiveRecord::Migration[4.2]
	def change
		create_table :answers do |t|
			t.string :title
			t.string :contents
			t.timestamps
		end
	end
end
