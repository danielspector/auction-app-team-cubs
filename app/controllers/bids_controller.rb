class BidsController < ApplicationController
  def create
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bids.build(amount: params[:amount], bidder_id: params[:bidder_id])
    if @bid.save
      redirect_to auction_path(@auction)
    else
      render auction_path(@auction)
    end

  end
end
