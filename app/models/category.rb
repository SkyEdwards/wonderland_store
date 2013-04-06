class Category < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_many :products
  
  validates_presence_of :description, :name
  validates_uniqueness_of :name
end
