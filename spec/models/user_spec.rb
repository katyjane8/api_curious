require 'rails_helper'

describe User do
  context "initialize" do
    it "exists with valid data" do
      auth = {
        uid: "123323",
        login: "katyjane8",
        token: "32423095"
        # name: "Katy",
        # username: "katyjane8",
        # avatar_url: "https://avatars1.githubusercontent.com/u/14926785?v=4",
        # followers: "10",
        # following: "12"
      }
      User.update_or_create(auth)
      new_user = User.first

      expect(new_user.uid).to eq "123323"
      expect(new_user.login).to eq "katyjane8"
      expect(new_user.token).to eq "32423095"
      # expect(new_user.name).to eq "Katy"
      # expect(new_user.avatar_url).to eq "https://avatars1.githubusercontent.com/u/14926785?v=4"
      # expect(new_user.followers).to eq "10"
      # expect(new_user.following).to eq "12"
    end
  end
end
