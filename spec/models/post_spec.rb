require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    it "can be created" do
      post = Post.create(date: Date.today, rationale: "Anything")
      expect(post).to be_valid
    end

    it "cannot be created empty" do
      post = Post.create(date: nil, rationale: "nil")
      expect(post).to_not be_valid
    end
  end
end