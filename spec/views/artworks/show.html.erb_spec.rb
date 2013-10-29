require 'spec_helper'

describe "artworks/show" do
  before(:each) do
    @artwork = assign(:artwork, stub_model(Artwork))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
