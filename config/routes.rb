RailsTemplateR31::Application.routes.draw do


  resources :catalogs
  resources :catalogs do
    member do
      get 'crop'
      put 'crop_update'
    end
  end
  
  get "cutters/index"

  get "cutters/show"

  resources :product_variations

  get "help/index"

  resources :prices

  resources :video_casts

  get "no_access/index"
  get "admin/index"
  get "about/index"
 
  devise_for :users
  

  root :to => "home#index"

  resources :carts do
    member { get 'checkout', 'order_confirmation'; put 'checkout' }
    collection { get 'current', 'checkout', 'place_order' }
  end
  
  resources :addresses,
            :helps,
            :products,  
            :product_lines,
            :screen_casts,
            :text_contents

  resources :news_blogs, :except => :show

  resources :product_lines do
    resources :products
    member do
      get 'crop'
      put 'crop_update'
    end
  end

  resources :users do
    resources :addresses
    member do
      get 'crop'
      put 'crop_update'
    end
  end

  resources :products do
    resources :product_variations do
      member { get 'add_to_cart' }
    end
    member do
      get 'crop'
      put 'crop_update'
    end
  end
  
#  get "home/index"
  root :to => "home#index"

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
  # match ':controller(/:action(/:id(.:format)))'
end
