class BidsController < ApplicationController
  def create
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bids.build(amount: params[:amount], bidder_id: params[:bidder_id])

    if @auction.bids.length == 0
      @bid.save
      redirect_to auction_path(@auction)
    end

    if params[:amount].to_i > @auction.highest_bid.amount_in_dollars

      if @bid.save
        redirect_to auction_path(@auction)
      else
        render auction_path(@auction)
      end
    else
      redirect_to "/auctions/#{@auction.id}"
    end
  end

  def new
    @auctions = Auction.all
  end

  def index
    @bids = Bid.all
  end
end
