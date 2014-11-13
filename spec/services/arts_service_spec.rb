require 'rails_helper'
require 'mock_redis'
RSpec.describe ArtsService do

  let (:some_arts) { FactoryGirl.create_list(:art, 3) }

  context 'given redis cache is empty' do
    before(:each) {
      $redis = MockRedis.new
      allow($redis).to receive(:get).with("arts").and_return(nil)
      allow(Art).to receive(:all).and_return(some_arts)
    }

    it "get_arts should populate redis cache from database" do
      expect(Art).to receive(:all)
      expect($redis).to receive(:set).with("arts", some_arts.to_json)
      ArtsService.get_arts
    end
  end

  context 'given redis cache has some arts' do
    before(:each) {
      $redis = MockRedis.new
      allow(Art).to receive(:all).and_return(some_arts)
      allow($redis).to receive(:get).with("arts").and_return(some_arts)
    }

    it "get_arts should not fetch database" do
      expect(Art).not_to receive(:all)
      ArtsService.get_arts
    end

    it "get_arts should return from redis cache" do
      expect($redis).to receive(:get).with("arts")
      ArtsService.get_arts
    end    
  end
end