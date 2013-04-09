class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :categories
  before_filter :initialize_session
  
 protected 
  def categories
    @all_categories = Category.all
  end
  
  def initialize_session
    session[:products] ||= []
    session[:quantity] ||= []
    session[:customer] ||= []
    session[:total] ||= []
    
    @my_products = []

    session[:products].each do |id|
        index = session[:products].index("#{id}")
        @my_products << {:product => Product.find(id), :quantity => session[:quantity][index]}
    end
    
  end
end
