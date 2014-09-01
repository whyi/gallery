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
  context "validation" do
    before(:each) {
      @article = FactoryGirl.build(:article)
    }
    subject { @article }

    it { should validate_presence_of("title") }
    it { should ensure_length_of("title").is_at_least(10).is_at_most(49) }
    it { should validate_presence_of("description") }
    it { should validate_presence_of("category_cd") }
    it { should ensure_inclusion_of("category_cd").in_range(0..2) }
    it { should validate_presence_of("width") }
    it { should ensure_inclusion_of("width").in_range(10..200) }
    it { should validate_presence_of("height") }
    it { should ensure_inclusion_of("height").in_range(10..200) }
    it { should validate_presence_of("filename") }
    it { should validate_presence_of("year") }
    it { should ensure_inclusion_of("year").in_range(2010..Date.today.year) }
    it { should validate_presence_of("medium") }
  end
end