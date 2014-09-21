require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET login," do
    it "returns http success" do
      get :login,
      expect(response).to be_success
    end
  end

  describe "GET home," do
    it "returns http success" do
      get :home,
      expect(response).to be_success
    end
  end

  describe "GET profile," do
    it "returns http success" do
      get :profile,
      expect(response).to be_success
    end
  end

  describe "GET setting" do
    it "returns http success" do
      get :setting
      expect(response).to be_success
    end
  end

end
