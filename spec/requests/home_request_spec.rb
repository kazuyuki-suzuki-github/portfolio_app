require 'rails_helper'

RSpec.describe "Homes", type: :request do

  describe "home controller" do

    it "responds successfully top" do
      get root_path
      expect(response).to have_http_status(200)
    end

    it "responds successfully about" do
      get about_path
      expect(response).to have_http_status(200)
    end

    it "responds successfully login" do
      get login_path
      expect(response).to have_http_status(200)
    end

    it "responds successfully contact" do
      get contact_path
      expect(response).to have_http_status(200)
    end
  
    it "responds successfully coin" do
      get coin_path
      expect(response).to have_http_status(200)
    end

  end
end
