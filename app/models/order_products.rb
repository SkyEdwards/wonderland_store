class OrderProducts < ActiveRecord::Base
  attr_accessible :order_id, :price, :product_id, :quantity
  
  belongs_to :orders
  belongs_to :products
  
  validates_presence_of :order_id, :price, :product_id, :quantity
end
