class DropRefColsFromVotes < ActiveRecord::Migration[4.2]
	def change
		remove_column :votes, :type, :string, null: false, default: ''
		remove_column :votes, :reference_id, :integer, null: false, default: ''
	end
end