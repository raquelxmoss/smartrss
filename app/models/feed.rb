class Feed < ActiveRecord::Base
  has_many :feed_subscriptions
  has_many :users, through: :feed_subscriptions
  has_many :articles
end