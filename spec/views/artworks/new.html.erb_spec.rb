require 'spec_helper'

describe "artworks/new" do
  before(:each) do
    assign(:artwork, stub_model(Artwork).as_new_record)
  end

  it "renders new artwork form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", artworks_path, "post" do
    end
  end
end
