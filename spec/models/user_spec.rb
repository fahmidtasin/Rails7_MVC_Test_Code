require 'rails_helper'

RSpec.describe User, type: :model do
  context "User Model Test:" do
    it 'has a valid factory' do
      expect(FactoryBot.build(:user)).to be_valid
    end

    it 'validates the email address' do
      expect(FactoryBot.build(:user, email: Faker::Internet.email)).to be_valid
      # expect(FactoryBot.build(:user, email: "samplesample.com")).not_to be_valid
      # expect(FactoryBot.build(:user, email: "sample@.com")).not_to be_valid
      # expect(FactoryBot.build(:user, email: "sample@")).not_to be_valid
      # expect(FactoryBot.build(:user, email: "sample@sample")).not_to be_valid
    end

    it 'validates the password is valid' do
      user = FactoryBot.build(:user)
      expect(user.password.length).to be <=6
    end
  end
end
