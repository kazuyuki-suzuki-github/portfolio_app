require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "#new" do
    it "respons successfully " do
      get new_user_path
      expect(response).to have_http_status(200)
    end
  end

  describe "#create" do
    it "respons successfully" do
      expect{
        post users_path, params: {user: FactoryBot.attributes_for(:user)}
      }.to change(User, :count).by(1)
      expect(response).to have_http_status(302)
    end

    it "respons successfully" do
      expect{
        post users_path, params: {user: FactoryBot.attributes_for(:user, name: nil)}
      }.to change(User, :count).by(0)
      expect(response).to have_http_status(200)
    end
  end

  describe "#edit" do
    it "respons successfully" do
      FactoryBot.create(:user)
      get edit_user_path(id: 1)
      expect(response).to have_http_status(200)
    end
  end

  describe "#destroy" do
    it "respons successfully" do
      FactoryBot.create(:user)
      delete user_path(id: 1)
      expect(response).to have_http_status(302)
    end
  end

  describe "#update" do
    it "respons successfully" do
      FactoryBot.create(:user)
      patch user_path(id: 1), params: {user: FactoryBot.attributes_for(:user)}
      expect(response).to have_http_status(302)
    end

    it "respons successfully" do
      FactoryBot.create(:user)
      patch user_path(id: 1), params: {user: FactoryBot.attributes_for(:user, name: nil)}
      expect(response).to have_http_status(200)
    end
  end
end
