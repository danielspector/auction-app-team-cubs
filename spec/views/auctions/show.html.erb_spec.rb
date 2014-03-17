require 'spec_helper'

describe "auctions/show" do
  before(:each) do
    @auction = assign(:auction, stub_model(Auction,
      :title => "Title",
      :description => "MyText",
      :price => 1,
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
