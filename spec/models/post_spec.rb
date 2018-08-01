require 'rails_helper'

describe Post, type: :model do

  let(:user) { User.create first_name: "John", last_name: "Doe", email: "john@doe.com", password: "some_password", password_confirmation: "some_password" }
  let(:post) { Post.new user: user, title: "Some title", body: 'Some more title to pass the validation......'}

  describe "Validations" do

    it "is valid with valid attributes" do
      expect(post).to be_valid
    end
    
    it "is not valid without a user" do
      post.user = nil
      expect(post).to_not be_valid
    end

    it "is not valid without a last name" do
      post.title = nil
      expect(post).to_not be_valid
    end

    it "is not valid without a body" do
      post.body = nil
      expect(post).to_not be_valid
    end

  end
end