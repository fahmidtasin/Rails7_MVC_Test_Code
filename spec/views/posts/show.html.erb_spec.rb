require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, user: user, title: "Title", content: "MyText", avatar: "sample.jpg")

    assign(:post, post)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
