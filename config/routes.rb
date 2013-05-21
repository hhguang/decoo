Decoo::Application.routes.draw do

  resources :porders

  resources :parts do
    collection do
      get :new_sp
    end
  end

  resources :packages

  resources :toys do
    resources :porders
  end

  resources :user_logs

  resources :roles

#  devise_for :users

  devise_for :users, :path => "account", :controllers => {
#      :registrations => :account,
      :sessions => :sessions,
#      :omniauth_callbacks => "users/omniauth_callbacks"
    }

  resources :users

  resources :outstock_items

  resources :outstocks do
    
  end


  resources :spec_properties

  resources :specs

  resources :in_stock_items

  resources :in_stocks

  resources :stocks

  resources :colors

  resources :products do
    resources :specs
  end

  get "main/index"
  post "outstocks/find_stock"

  resources :photos

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
   root :to => 'main#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
