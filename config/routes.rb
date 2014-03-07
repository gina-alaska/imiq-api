ImiqApi::Application.routes.draw do
  resources :organizations do
    collection do
      get 'list'
    end
  end

  resources :variables do
    collection do
      get 'list'
    end
  end

  # resources :daily_values, only: [], as: :daily do
  #   collection do
  #     get ':field', to: :daily
  #     # get 'airtemps'
  #     # get 'rhs'
  #   end
  # end
  get '/derived/:time_step/*variables' => 'derived_values#index', defaults: { format: 'csv' }, as: 'derived_values'
  get '/daily/:field(.:format)' => 'daily_values#values', defaults: { format: 'csv' }, as: 'daily_values'
  get '/hourly/:field(.:format)' => 'hourly_values#values', defaults: { format: 'csv' }, as: 'hourly_values'

  resources :sites, except: [:new, :update, :destroy, :create, :edit], defaults: { format: 'json' } do
    member do
      get :downloads
    end
  end
  resources :sources, except: [:new, :update, :destroy, :create, :edit]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get 'help' => 'welcome#help'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
