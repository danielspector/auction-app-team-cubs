class Bid < ActiveRecord::Base
  before_save :store_in_cents

  belongs_to :auction
  belongs_to :bidder, class_name: "User"

  def amount_in_dollars
    self.amount = amount/100.00
  end

  def store_in_cents
    self.amount = amount * 100 if self.amount
  end
end
