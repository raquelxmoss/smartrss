class UserArticleState < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  scope :visible, -> { where(read: false) }
end