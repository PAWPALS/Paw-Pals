Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  post "/signup", to: "registrations#create"
  delete "/signup", to: "registrations#destroy"

  post "/login", to: "registrations#login"

  post "/pets", to: "pets#create"
  get "/pets", to: "pets#index"
  get "/pets/:pet_id", to: "pets#show"
  delete "/pets/:pet_id", to: "pets#destroy"
  put "/pets/:pet_id", to: "pets#update"

  get "/users/:id/pets", to: "pets#users_index"

  post "/pet_notices/:pet_id", to: "pet_notices#create"
  get  "/pet_notices/:pet_id", to: "pet_notices#show"
  get "/pet_notices/index/:pet_id", to: "pet_notices#index"
  post "/pet_notices/location/:pet_id", to: "pet_notices#enter_location"
  get "/pet_notices/pets/all_lost", to: "pet_notices#index_all_lost"

  get "/pet_checkins/:id", to: "pet_checkins#show"
  get "/pet_checkins/index/:id", to: "pet_checkins#index"

  resources :addresses do 
  end

  get "/users/:id/addresses", to: "addresses#users_address"

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
