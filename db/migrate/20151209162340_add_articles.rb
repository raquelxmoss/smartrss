class AddArticles < ActiveRecord::Migration
  def change
  	create_table :articles do |t|
  		t.integer :feed_id
  		t.string :author
  		t.text :title
  		t.text :content
  		t.text :guid
  		t.datetime :published_at
  	end

  	create_table :user_article_states do |t|
  		t.integer :user_id
  		t.integer :article_id
  		t.boolean :read, default: false
  		t.boolean :archived, default: false
  	end

  	create_table :feed_subscriptions do |t|
  		t.integer :feed_id
  		t.integer :user_id
  		t.integer :unread_entries
  	end

  	remove_column :feeds, :user_id
  end
end
