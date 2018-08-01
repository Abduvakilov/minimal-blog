require 'rails_helper'

describe User, type: :model do
  subject { described_class.new first_name: "John", last_name: "Doe", email: "john@doe.com", password: "some_password", password_confirmation: "some_password" }

  describe "Validations" do

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    
    it "is not valid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

  end
end