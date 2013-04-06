class StoreController < ApplicationController
  def index
    @featured = Product.where(:featured => true)
    @new_products = Product.order(:created_at).limit(3)
    @updated_products = Product.order(:updated_at).limit(3)
  end
  
  def category
    @category_products = Category.find(params[:id]).products
  end
  
  def product
    @product = Product.find(params[:id])
  end
  
  def contact
    @contact = Page.where("name = 'Contact'")
  end
  
  def about
    @about = Page.where("name = 'About'")
  end
  
  def sale
    @sale_products = Product.where("sale_price IS NOT NULL").where("sale_price != 0.0")
  end
  
  def add_product
    session[:products] << params[:id]
    #not sure if I want this to redirect to the home page all the time
    redirect_to root_url
  end
  
  def remove_product
    session[:products].delete(params[:id])
    #not sure if I want this to redirect to the home page all the time
    redirect_to root_url
  end
  
  def clear_products
    session[:products] = nil
    #not sure if I want this to redirect to the home page all the time
    redirect_to root_url
  end
end
