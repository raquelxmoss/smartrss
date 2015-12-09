class AddTitleAndUpdateTimeToFeed < ActiveRecord::Migration
  def change
  	add_column :feeds, :title, :string
  	add_column :feeds, :last_fetched, :datetime
  end
end
