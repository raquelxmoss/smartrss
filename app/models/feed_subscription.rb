class FeedSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :feed
end