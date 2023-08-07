require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:post) do
    Post.create!(
      title: "MyString",
      content: "MyText",
      avatar: "MyText",
      user: user
    )
  end

  before(:each) do
    assign(:post, post)
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(post), "post" do
      assert_select "input[name=?]", "post[title]"
      assert_select "textarea[name=?]", "post[content]"

      # Update this assertion for the file upload field
      assert_select "input[name=?][type=?]", "post[avatar]", "file"
    end
  end
end
