class BidsController < ApplicationController
  before_action :login_required, :only => [:create, :new]

  def create
    @auction = Auction.find(params[:auction_id])
    @bid = @auction.bids.build(amount: params[:amount], bidder_id: session[:user_id])


    if @auction.bids.length == 1 || (params[:amount].to_i > @auction.highest_bid.amount_in_dollars)

      if @bid.save
        flash[:notice] = 'You are the current high bidder!'
        redirect_to auction_path(@auction)
      else
        render auction_path(@auction)
      end
    else
      if params[:amount].to_i == 0 || params[:amount].include?(",")
        flash[:notice] = 'Amount is not a number'
        redirect_to "/auctions/#{@auction.id}"
      else
        flash[:notice] = 'Amount is too low!'
        redirect_to "/auctions/#{@auction.id}"
      end
    end
  end

  def new
    @auctions = Auction.all
  end

  def index
    @bids = Bid.all
  end
end
