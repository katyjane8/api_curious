require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github omniauth" do
    VCR.use_cassette("features/user_logs_in_with_github") do
      stub_omniauth

      visit root_path

      expect(page).to have_link("Sign in with Github")

      click_link "Sign in with Github"

      expect(page).to have_content("Kathrine")
      expect(page).to have_content("katyjane8")
      expect(page).to have_content("Louisville, CO")
      expect(page).to have_content("www.kathrinewelyczko.com")
      expect(page).to have_content("katy.jane8@gmail.com")
      expect(page).to have_link("Logout")
    end
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: "github",
      uid: "12345678910",
      info:
      {"nickname"=>"katyjane8",
        "email"=>"katy.jane8@gmail.com",
        "name"=>"Kathrine",
        "image"=>"https://avatars1.githubusercontent.com/u/14926785?v=4",
        "urls"=>{"GitHub"=>"https://github.com/katyjane8", "Blog"=>"www.kathrinewelyczko.com"}},
      credentials:
        {"token"=>ENV["GH_TESTING_TOKEN"]}})
  end
end
