require 'scrypt'

class User < ActiveRecord::Base
	has_many :feeds

	validates :name, presence: true
	validates :email, presence: true

	before_create :encrypt_password!

	def encrypt_password!
		password = SCrypt::Password.create(password)
	end

	def authorize_password
		SCrypt::Password.new(password) == password
	end
end
