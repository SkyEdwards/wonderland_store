class Order < ActiveRecord::Base
  attr_accessible :customer_id, :discount_rate, :gst_rate, :hst_rate, :pst_rate, :status
  
  belongs_to :customer
  has_many :products, :through => :order_products
  
  validates_presence_of :customer_id
  
  def name
    self.customer.name + " -- #{self.created_at.strftime("%m/%d/%Y %H:%M:%S%Z")}"
  end
end
