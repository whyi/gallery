require 'rails_helper'

def build_article_with_missing(attribute_name)
    @article = FactoryGirl.build(:article)
    @article[attribute_name] = nil
    @article
end

def build_article_with_blank(attribute_name)
    @article = FactoryGirl.build(:article)
    @article[attribute_name] = ""
    @article
end

def build_article_with(attribute_name, attribute_value)
    @article = FactoryGirl.build(:article)
    @article[attribute_name] = attribute_value
    @article
end

describe Article do
  ["title", "description", "category_cd", "width", "height", "filename"].each { |attribute_name|
    context "article with missing " + attribute_name do  
      before(:each) {
        @article = build_article_with_missing(attribute_name)
      }
      subject { @article }

      it "cannot be saved" do
        expect(@article.save).to be false
      end
    end

    context "article with blank " + attribute_name do
      before(:each) {
        @article = build_article_with_blank(attribute_name)
      }
      subject { @article }

      it "cannot be saved" do
        expect(@article.save).to be false
      end
    end
  }

  context "article with too short title" do
    before(:each) {
      @article = build_article_with("title", "foo")
    }
    subject { @article }

    it "cannot be saved" do
      expect(@article.save).to be false
    end
  end

  context "article with too long title" do
    before(:each) {
      @article = build_article_with("title", "this_is_longer_than_50_this_is_longer_than_50_this_is_longer_than_50_this_is_longer_than_50_this_is_longer_than_50_this_is_longer_than_50_")
    }
    subject { @article }

    it "cannot be saved" do
      expect(@article.save).to be false
    end
  end

  context "article with title length 10 <= length < 50 " do
    before(:each) {
      @article = build_article_with("title", "this is a test")
    }
    subject { @article }

    it "can be saved" do
      expect(@article.save).to be true
    end
  end

  context "article with wrong category " do
    before(:each) {
      @article = build_article_with("category_cd", 10)
    }
    subject { @article }

    it "cannot be saved" do
      expect(@article.save).to be false
    end
  end

  context "article with correct category " do
    before(:each) {
      @article = build_article_with("category_cd", 2)
    }
    subject { @article }

    it "can be saved" do
      expect(@article.save).to be true
    end
  end

  context "article with wrong width " do
    before(:each) {
      @article = build_article_with("width", -100)
    }
    subject { @article }

    it "cannot be saved" do
      expect(@article.save).to be false
    end
  end

  context "article with correct width " do
    before(:each) {
      @article = build_article_with("width", 10)
    }
    subject { @article }

    it "can be saved" do
      expect(@article.save).to be true
    end
  end

  context "article with wrong height " do
    before(:each) {
      @article = build_article_with("height", -100)
    }
    subject { @article }

    it "cannot be saved" do
      expect(@article.save).to be false
    end
  end

  context "article with correct height " do
    before(:each) {
      @article = build_article_with("height", 10)
    }
    subject { @article }

    it "can be saved" do
      expect(@article.save).to be true
    end
  end
end
