class AddFreightDetailsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :freight_price, :float, :default => 0.0
    add_column :products, :freight_delivery_time, :integer, :default => 0
  end
end
