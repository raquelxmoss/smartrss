require 'spec_helper'

describe 'User' do
	it 'validates email address' do
		user = User.new(name: "Raquel", encrypted_password: "test", email: "notanemail")
		user.save
		expect(user).to be_invalid
		expect(user.errors.full_messages).to include("Email appears to be invalid")
	end
end