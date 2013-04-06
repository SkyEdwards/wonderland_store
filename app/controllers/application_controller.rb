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
    @my_products = []
    session[:products].each { |id| @my_products << Product.find(id)}
  end
end
