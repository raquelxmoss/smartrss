class AddFeeds < ActiveRecord::Migration
  def change
  	create_table :feeds do |t|
  		t.integer :user_id
  		t.string :url
  		t.timestamps null: false
  	end
  end
end
