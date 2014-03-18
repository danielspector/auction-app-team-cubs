class Auction < ActiveRecord::Base

  has_many :bids, dependent: :destroy
  belongs_to :seller, class_name: "User"
  validates_uniqueness_of :title

  validates_presence_of :end_time

  # validate :not_ended?
  # validates_date :end_time, :on_or_before => lambda { Time.now }
  
  def price_in_dollars
    self.price = price/100.00
  end

  def highest_bid
    self.bids.order(amount: :desc).limit(1).first if self.bids
  end

  # def not_ended?
  #   if self.end_time && (self.end_time >= Chronic.parse("March 17, 2014"))
  #     errors.add(:end_time, "Can't be in the past")
  #   end
  # end
end
