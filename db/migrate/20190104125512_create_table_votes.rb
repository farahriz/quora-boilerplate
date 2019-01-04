class CreateTableVotes < ActiveRecord::Migration[4.2]
	def change
		create_table :votes do |t|
			t.integer :reference_id
			t.string :type
			t.string :value
			t.timestamps
		end
	end
end