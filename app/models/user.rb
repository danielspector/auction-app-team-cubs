class User < ActiveRecord::Base
  has_secure_password validations: false
  has_many :bids, foreign_key: "bidder_id"
  has_many :listings, class_name: "Auction", foreign_key: "seller_id"
end
