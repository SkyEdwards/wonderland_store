class Products < ActiveRecord::Base
  attr_accessible :description, :name, :price
  
  has_many :order_products
  
  validates_presence_of :description, :name, :price
end
