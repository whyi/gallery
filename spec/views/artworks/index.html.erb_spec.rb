require 'spec_helper'

describe "artworks/index" do
  before(:each) do
    assign(:artworks, [
      stub_model(Artwork),
      stub_model(Artwork)
    ])
  end

  it "renders a list of artworks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
