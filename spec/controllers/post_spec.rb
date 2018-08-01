require 'rails_helper'
require_relative 'sign_up_helper'

describe "Post" do
	include SignUpHelper

	it "should not be new without logging in" do
		visit 'posts/new'
		expect(page).to have_content "You need to sign in or sign up before continuing."
	end

end