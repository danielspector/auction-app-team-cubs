class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :edit, :update, :destroy]

  # GET /auctions
  # GET /auctions.json
  def index
    @auctions = Auction.all
  end

  # GET /auctions/1
  # GET /auctions/1.json
  def show
  end

  # GET /auctions/new
  def new
    @auction = Auction.new
  end

  # GET /auctions/1/edit
  def edit
  end

  # POST /auctions
  # POST /auctions.json
  def create
    params[:auction][:price] = (params[:auction][:price].to_f*100).to_i
    @auction = Auction.new(auction_params)

    respond_to do |format|
      if @auction.save
        format.html { redirect_to @auction, notice: 'Auction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @auction }
      else
        format.html { render action: 'new' }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auctions/1
  def update
    #Refactor this crap. Find a way to put this in the model.
    if @auction.end_time > Time.now
      @auction.update(auction_params)
      redirect_to @auction, notice: 'Auction was successfully updated.'
    else
      render action: 'edit', notice: "The auction has already ended"
    end
  end

  def destroy
    if @auction.destroy
      redirect_to auctions_path
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auction_params
      params.require(:auction).permit(:title, :description, :price, :end_time, :seller_id)
    end
end
