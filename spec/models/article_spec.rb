require 'rails_helper'

describe Article do

  context "when title is missing" do  
    before(:each) {
      @article = nil
      @article = FactoryGirl.build(:article)
      @article[:title] = nil
    }
    subject { @article }

    it "cannot be saved" do
      expect(@article.save).to be false
    end
  end
end
