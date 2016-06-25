class AddIndex < ActiveRecord::Migration
	def change
		add_index :urls, :short_link
	end
end