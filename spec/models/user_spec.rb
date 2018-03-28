require 'rails_helper'

RSpec.describe User, type: :model do
  context "initialize" do
    it "exists with valid data" do
      auth = {
        "uid" => "123323",
        "info" => { "nickname" => "katyjane8" },
        "credentials" => { "token" => "32423095" }
      }

      new_user = User.from_omniauth(auth)

      expect(new_user.uid).to eq "123323"
      expect(new_user.login).to eq "katyjane8"
      expect(new_user.token).to eq "32423095"
    end
  end
end
