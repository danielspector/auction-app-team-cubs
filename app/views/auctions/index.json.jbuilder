json.array!(@auctions) do |auction|
  json.extract! auction, :id, :title, :description, :price, :end_time, :user_id
  json.url auction_url(auction, format: :json)
end
