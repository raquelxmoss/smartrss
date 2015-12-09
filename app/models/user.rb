require 'scrypt'

class User < ActiveRecord::Base
	has_many :feed_subscriptions
	has_many :feeds, through: :feed_subscriptions
	has_many :articles, through: :feeds
	has_many :user_article_states

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	# validates :encrypted_password, length: { in: 6..20 }
	validate :validate_email_format!

	# before_create :encrypt_password!
	before_create :normalize_email!


	def validate_email_format!
		unless self.email =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
			errors.add(:email, "appears to be invalid")
		end
	end

	def normalize_email!
		self.email = self.email.downcase
	end

	def encrypt_password!
		self.encrypted_password = SCrypt::Password.create(self.encrypted_password)
	end

	def authorize_password(password)
		SCrypt::Password.new(self.encrypted_password) == password
	end
end
