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
    view.extend Devise::Test::ControllerHelpers
    allow(view).to receive(:current_user).and_return(user)
  end

  it "renders a list of posts" do
    render

    expect(rendered).to have_text("Title")
    expect(rendered).to have_text("MyText")
    expect(rendered).to have_link("Show this post", href: post_path(post))

    # Verify that the user's email is displayed in the view
    expect(rendered).to have_text("Current user: #{user.email}")

    # Check if the Logout button is present when user is signed in
    expect(rendered).to have_button("Logout")

    # Check if the New post link is present
    expect(rendered).to have_link("New post", href: new_post_path)
  end

  it "displays Login link when user is not signed in" do
    # Clear the mocked current_user for this test
    allow(view).to receive(:current_user).and_return(nil)
    render

    # Check if the Login link is present when user is not signed in
    expect(rendered).to have_link("Login", href: new_user_session_path)
  end
end
