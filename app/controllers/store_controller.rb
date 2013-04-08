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
  
  def new
    @new_products = Product.order(:created_at)
  end
  
  def updated
    @updated_products = Product.order(:updated_at)
  end
  
  def all
    @all_products = Product.order(:category_id)
  end
  
  def check_out
    
  end
  
  def customer_info
    @customer = Customer.new
    @provinces = Province.order(:name)
  end
  
  
  def search_results
    keywords = params[:keywords]
    
    @product = Product.where("name LIKE ? OR description LIKE ?", "%#{keywords}%", "%#{keywords}%")
    
    if @product.empty? 
      flash[:custom] = "No results found for #{params[:keywords]}" 
      redirect_to root_url
    end

  end
  
  def add_product
      if session[:products].include?(params[:id])
        index = session[:products].index("#{params[:id]}")
        session[:quantity][index] += 1
      else
        session[:products] << params[:id]
        session[:quantity] << 1
      end
    
    redirect_to :back
  end
  
  def remove_product
    index = session[:products].index("#{params[:id]}")
    if session[:quantity][index] > 1
      session[:quantity][index] -= 1
    else
    session[:quantity].delete(index)
    session[:products].delete(params[:id])
    end
    
    redirect_to :back
  end
  
  def clear_products
    session[:products] = nil
    session[:quantity] = nil

    redirect_to :back
  end
end
