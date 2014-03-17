class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.datetime :end_time
      t.integer :seller_id

      t.timestamps
    end
  end
end
