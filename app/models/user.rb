require 'scrypt'

class User < ActiveRecord::Base
	has_many :feeds

	validates :name, presence: true
	validates :email, presence: true

	before_create :encrypt_password!
	before_create :normalize_email

	def normalize_email
		self.email = self.email.downcase
	end

	def encrypt_password!
		self.encrypted_password = SCrypt::Password.create(self.encrypted_password)
	end

	def authorize_password(password)
		SCrypt::Password.new(self.encrypted_password) == password
	end
end
