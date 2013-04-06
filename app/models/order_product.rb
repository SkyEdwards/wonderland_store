class OrderProduct < ActiveRecord::Base
  attr_accessible :order_id, :price, :product_id, :quantity
  
  belongs_to :order
  belongs_to :product
  
  validates_presence_of :order_id, :price, :product_id, :quantity
end
