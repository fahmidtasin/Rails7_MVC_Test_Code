require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  let(:user) { FactoryBot.create(:user) }

  before(:each) do
    assign(:post, Post.new(user: user))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "input[name=?]", "post[title]"
      assert_select "textarea[name=?]", "post[content]"

      # Update this assertion for the file upload field
      assert_select "input[name=?][type=?]", "post[avatar]", "file"
    end
  end
end
