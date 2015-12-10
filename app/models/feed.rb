require 'feedjira'

class Feed < ActiveRecord::Base
  has_many :feed_subscriptions
  has_many :users, through: :feed_subscriptions
  has_many :articles

  validates :url, presence: true, format: { with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/, 
																					  message: "That looks like an invalid url" }
  def self.add_new(url)
    feed = Feedjira::Feed.fetch_and_parse(url)
    Feed.find_or_create_by!(url: feed.url, title: feed.title)
  end
end