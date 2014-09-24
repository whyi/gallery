require 'rails_helper'

=begin
http://guides.rubyonrails.org/testing.html#functional-tests-for-your-controllers
4.1 What to Include in your Functional Tests
You should test for things such as:

was the web request successful?
was the user redirected to the right page?
was the user successfully authenticated?
was the correct object stored in the response template?
was the appropriate message displayed to the user in the view?
=end

RSpec.describe UsersController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST create" do
    it "returns http success for valid user params" do
      post :create, user: attributes_for(:user)
      expect(response).to be_success
    end

    it "raises error for invalid user params" do
      expect {
        post :create, user: attributes_for(:user, password: nil)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end    

    it "raises error when user param is nil" do
      expect{
        post :create, user: nil
      }.to raise_error(ActionController::ParameterMissing)
    end
  end

end
