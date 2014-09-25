require 'rails_helper'

RSpec.describe "Home", :type => :request do
  describe "GET /" do
    it "returns 200" do
      get "/"
      expect(response).to have_http_status(200)
    end

    it "renders layout view" do
      get "/"
      expect(response).to render_template('layouts/application')
    end    
  end
end
