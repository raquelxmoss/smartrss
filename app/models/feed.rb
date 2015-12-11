require 'feedjira'
require 'pry'

class Feed < ActiveRecord::Base
  has_many :feed_subscriptions
  has_many :users, through: :feed_subscriptions
  has_many :articles

  validates :url, presence: true, format: { with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/, 
                                            message: "That looks like an invalid url" }
  def self.add_new(url)
    raw_feed = get_feed(url)
    feed = Feed.find_or_create_by!(url: raw_feed.url, title: raw_feed.title)
    feed.add_initial_articles
  end

  def add_initial_articles
    raw_articles = get_feed(self.url)
    binding.pry
    raw_articles.each { |a| articles << a }
  end

  def self.get_feed(url)
    Feedjira::Feed.fetch_and_parse(url)
  end
end