class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :image, :category_id, :sale_price, :featured
  
  has_many :orders, :through => :order_products
  belongs_to :category
  
  validates_presence_of :description, :name, :price, :category_id
end
