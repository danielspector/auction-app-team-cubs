class BidsController < ApplicationController
  def create
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bids.build(amount: params[:amount], bidder_id: params[:bidder_id])
    # binding.pry
    if params[:amount].to_i > @auction.highest_bid.amount_in_dollars
      if @bid.save
        redirect_to auction_path(@auction)
      else
        render auction_path(@auction)
      end
    else
      render new_bid_path
    end
  end

  def new
    @auctions = Auction.all
  end

  def index
    @bids = Bid.all
  end
end
