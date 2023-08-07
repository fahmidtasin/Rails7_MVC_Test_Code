require 'rails_helper'

# spec/models/post_spec.rb

RSpec.describe Post, type: :model do

  context "Post Model Test:" do

    post = FactoryBot.create(:post)

    it "ensures title not be null" do
      expect(post.title).not_to be nil
    end

    it "ensures content not be null" do
      expect(post.content).not_to be nil
    end

    it "ensures image not be null" do
      expect(post.image).not_to be nil
    end


  end

end

