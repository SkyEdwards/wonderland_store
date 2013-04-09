class Product < ActiveRecord::Base
  before_save :default_values
  attr_accessible :description, :name, :price, :image, :category_id, :sale_price, :featured
  
  has_many :orders, :through => :order_products
  belongs_to :category
  
  validates_presence_of :description, :name, :price, :category_id
  validates :image, :format => { :with => /.+\.(?:jpe?g|png|gif)$/, :message => "Image must have a file type of jpeg, jpg, png or gif" }, :allow_blank => true, :allow_nil => true
  

  def default_values
    self.sale_price ||= 0.0
  end
end
