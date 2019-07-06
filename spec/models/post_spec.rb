require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.create!(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Jon", last_name: "Snow", username: "watcheronthewall")
    login_as(@user, scope: :user)
  end
  describe "Creation" do
    it "can be created" do
      post = Post.create(date: Date.today, rationale: "Anything", user: @user)
      expect(post).to be_valid
    end

    it "cannot be created empty" do
      post = Post.create(date: nil, rationale: "nil", user: @user)
      expect(post).to_not be_valid
    end
  end
end