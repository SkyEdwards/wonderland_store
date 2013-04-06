class Customer < ActiveRecord::Base
  attr_accessible :city, :country, :email, :first_name, :last_name, :postal_code, :province_id, :street_address
  
  belongs_to :province
  has_many :orders
  
  validates_presence_of :first_name, :last_name, :city, :country, :postal_code, :street_address, :province_id
  
  def name
    self.first_name + " " + self.last_name
  end
end
