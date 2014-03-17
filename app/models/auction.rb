class Auction < ActiveRecord::Base

  has_many :bids, dependent: :destroy
  belongs_to :seller, class_name: "User"

  def price_in_dollars
    self.price = price/100.00
  end
end
