require 'feedjira'
require 'pry'

class Feed < ActiveRecord::Base
  has_many :feed_subscriptions
  has_many :users, through: :feed_subscriptions
  has_many :articles

  validates :url, presence: true, format: { with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/, 
                                            message: "That looks like an invalid url" }
  def self.add_new(url)
    raw_feed = Feed.get_feed(url)
    feed = Feed.find_or_create_by!(url: url, title: raw_feed.title)
    feed.add_initial_articles
    feed
  end

  def add_initial_articles
    raw_articles = Feed.get_feed(self.url).entries
    raw_articles.each do |a| 
      articles << Article.create(
      title: a.title, author: a.author, 
      content: a.content, summary: a.summary, url: a.url
      ) 
    end
  end

  def self.get_feed(url)
    Feedjira::Feed.fetch_and_parse(url)
  end
end