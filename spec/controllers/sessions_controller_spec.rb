require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  context 'given user is not logged in' do
    describe "when visit login page" do
      subject { get :login }

      it "render the login form" do
        expect(subject).to be_success
      end
    end

    describe "when logout" do
      subject { post :logout }

      it "redirects to root" do
        expect(subject).to redirect_to root_path
      end

      it "should set session[:id] to null" do
        expect(session[:id]).to be_nil
      end
    end    
  end

  context 'given user is logged in' do
    before(:each) {
      user = create(:user)
      login(user)
    }

    describe "when visit login page" do
      subject { get :login }

      it "should redirect to art#index" do
        expect(subject).to redirect_to(:controller => 'arts', :action => 'index')
      end
    end

    describe "when logout" do
      subject { post :logout }

      it "redirects to root" do
        expect(subject).to redirect_to root_path
      end

      it "should set session[:id] to null" do
        expect(session[:id]).to be_nil
      end      
    end    
  end
end