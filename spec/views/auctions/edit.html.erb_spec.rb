require 'spec_helper'

describe "auctions/edit" do
  before(:each) do
    @auction = assign(:auction, stub_model(Auction,
      :title => "MyString",
      :description => "MyText",
      :price => 1,
      :user_id => 1
    ))
  end

  it "renders the edit auction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", auction_path(@auction), "post" do
      assert_select "input#auction_title[name=?]", "auction[title]"
      assert_select "textarea#auction_description[name=?]", "auction[description]"
      assert_select "input#auction_price[name=?]", "auction[price]"
      assert_select "input#auction_user_id[name=?]", "auction[user_id]"
    end
  end
end
