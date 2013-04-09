WonderlandStore::Application.routes.draw do
  
  root :to => "store#index"
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :store
  match "index" => "store#index", :via => :get, :as => "index"
  
  match "about" => "store#about", :via => :get, :as => "about"
  
  match "contact" => "store#contact", :via => :get, :as => "contact"
  
  match "admin" => "store#admin", :via => :get, :as => "admin"
  
  match "sale" => "store#sale", :via => :get, :as => "sale"
  
  match "new" => "store#new", :via => :get, :as => "new"
  
  match "all" => "store#all", :via => :get, :as => "all"
  
  match "updated" => "store#updated", :via => :get, :as => "updated"
  
  match "check_out" => "store#check_out", :via => :get, :as => "check_out"
  
  match "customer_info" => "store#customer_info", :via => :get, :as => "customer_info"
  
  match "add_order" => "store#add_order", :via => :get, :as => "add_order"
  
  match "customers" => "store#customers", :via => :post, :as => "customers"
  
  match "product/:id" => "store#product", :via => :get, :as => "product"
  
  match "category/:id" => "store#category", :via => :get, :as => "category"
  
  match "add_product/:id" => "store#add_product", :via => :get, :as => "add_product"
        
  match "remove_product/:id" => "store#remove_product", :via => :get, :as => "remove_product"
  
  match "clear_products" => "store#clear_products", :via => :get, :as => "clear_products"
  
  match "search_results" => "store#search_results", :via => :post, :as => 'search_results'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
