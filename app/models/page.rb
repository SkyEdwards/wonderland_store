class Page < ActiveRecord::Base
  attr_accessible :content, :name
  
  validates_presence_of :content, :name
end
