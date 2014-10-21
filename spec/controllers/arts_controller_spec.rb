require 'rails_helper'

=begin
http://guides.rubyonrails.org/testing.html#functional-tests-for-your-controllers
4.1 What to Include in your Functional Tests
You should test for things such as:

was the web request successful?
was the Art redirected to the right page?
was the Art successfully authenticated?
was the correct object stored in the response template?
was the appropriate message displayed to the Art in the view?
=end

RSpec.describe ArtsController, :type => :controller do
  context 'given user is not logged in' do
    describe "when visit new page" do
      subject { get :new }

      it "redirect to login form" do
        expect(subject).to redirect_to(:controller => 'sessions', :action => 'login')
      end
    end
  end

  context 'given user is logged in' do
    before(:each) {
      user = create(:user)
      login(user)
    }

    describe "when visit new page" do
      subject { get :new }

      it "shows the new form" do
        expect(subject).to be_success
      end
    end
  end  
end
