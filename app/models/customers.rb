class Customers < ActiveRecord::Base
  attr_accessible :city, :country, :email, :firs_name, :last_name, :postal_code, :province_id, :street_address
  
  belongs_to :provinces
  has_many :orders
  
  validates_presence_of :firs_name, :last_name, :city, :country, :postal_code, :street_address, :province_id
end
