require 'rails_helper'
require_relative 'sign_up_helper'

describe "Sign Up and Log in" do
	include SignUpHelper
	it "should create new user account and log in" do
		sign_up
		expect(page).to have_content "Welcome! You have signed up successfully."


		# Sign out and Log in
		visit 'users/sign_out'
		visit 'users/sign_in'
		fill_in 'user_email',      with: @email
		fill_in 'user_password',   with: @password
		click_button 'Log in'
		expect(page).to have_content "Signed in successfully."

	end

end