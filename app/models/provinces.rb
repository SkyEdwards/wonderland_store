class Provinces < ActiveRecord::Base
  attr_accessible :gst, :hst, :name, :pst
  
  has_many :customers
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
