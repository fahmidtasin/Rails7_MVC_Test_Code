require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:post) do
    Post.create!(
      title: "Title",
      content: "MyText",
      avatar: "MyText",
      user: user
    )
  end

  before(:each) do
    assign(:posts, [post])
    # Include Devise test helpers
    view.extend Devise::Test::ControllerHelpers
    # Manually set the current_user variable
    allow(view).to receive(:current_user).and_return(user)
  end

  it "renders a list of posts" do
    render

    # Check if the post title, content, and link to show are present in the view
    expect(rendered).to have_text("Title")
    expect(rendered).to have_text("MyText")
    expect(rendered).to have_link("Show this post", href: post_path(post))

    # Check if the current user email is displayed
    expect(rendered).to have_text("Current user: #{user.email}")
  end
end
