class Orders < ActiveRecord::Base
  attr_accessible :customer_id, :discount_rate, :gst_rate, :hst_rate, :pst_rate, :status
  
  belongs_to :customers
  has_many :order_products
  
  validates_presence_of :customer_id, :status
end
