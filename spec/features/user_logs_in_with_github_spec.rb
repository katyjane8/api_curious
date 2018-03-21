require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github oauth" do
    stub_omniauth

    visit root_path

    expect(page).to have_link("Sign in with Github")

    click_link "Sign in with Github"

    expect(page).to have_link("Logout")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: "github",
      uid: "12345678910",
      info:
      {"username"=>"katyjane8",
        "email"=>"katy.jane8@gmail.com",
        "name"=>"Kathrine",
        "nickname"=>"katyjane8",
        "image"=>"https://avatars1.githubusercontent.com/u/14926785?v=4",
        "urls"=>{"GitHub"=>"https://github.com/katyjane8", "Blog"=>"www.kathrinewelyczko.com"}},
      credentials:
        {"token"=>"abcdefg12345"}})
  end
end
