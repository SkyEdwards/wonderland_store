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
    @customer = Customer.find(session[:customer][0])
    @total = session[:total][0]
    @grand_total = 0.0
  end
  
  def customer_info
    @customer = Customer.new
    @provinces = Province.order(:name)
  end
  
  def add_order
    customer = Customer.find(session[:customer][0])
    product = customer.province
    order = Order.new( :customer_id => customer.id,
                        :gst_rate => product.gst,
                        :pst_rate => product.pst, 
                        :hst_rate => product.hst
                      )
    
    if (order.save)
      
      @my_products.each do |my_product|
        price = my_product[:product].price - my_product[:product].sale_price
        order_product = OrderProduct.new(:order_id => order.id,
                                          :product_id => my_product[:product].id,
                                          :price => price,
                                          :quantity => my_product[:quantity]
                                          )
        order_product.save
      end
      
      flash[:custom] = "Order completed successfully." 
    else
      flash[:custom] = "Order Could Not Be processed."
    end
    
    session[:products] = nil
    session[:quantity] = nil
    
    redirect_to root_url
  end
  
  def customers
    @customer = Customer.new(params[:customer])
    @customer.save

    if session[:customer][0].nil?
      session[:customer][0] << @customer.id
    else
      session[:customer][0] = @customer.id
    end

    redirect_to check_out_path
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
      
      if Product.find(params[:id]).sale_price == 0.0
        price = Product.find(params[:id]).price        
      else
        price = Product.find(params[:id]).sale_price
      end
         
      session[:total][0] += price
      
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
    
    if Product.find(params[:id]).sale_price == 0.0
      price = Product.find(params[:id]).price        
    else
      price = Product.find(params[:id]).sale_price
    end
    
    session[:total][0] -= price
    
    redirect_to :back
  end
  
  def clear_products
    session[:products] = nil
    session[:quantity] = nil
    session[:total][0] = 0.0

    redirect_to :back
  end
end
