class CreateUserTable < ActiveRecord::Migration[4.2]
	def change
		create_table :users do |t|
			t.string :email
			t.string :password
			t.timestamps
		end
	end
end