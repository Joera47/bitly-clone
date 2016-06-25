class AddColumnClickcount < ActiveRecord::Migration
	def change
		add_column :urls, :clickcount, :integer, default: 0
	end
end