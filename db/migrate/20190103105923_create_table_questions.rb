class CreateTableQuestions < ActiveRecord::Migration[4.2]
	def change
		create_table :questions do |t|
			t.string :title
			t.string :content

			t.timestamps
		end
	end
end