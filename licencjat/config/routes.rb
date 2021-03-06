Rails.application.routes.draw do

  get 'error/not_found'

  devise_for :users
  root to: 'static_pages#home'

  get 'static_pages/home'

  get 'static_pages/tips'

  get 'static_pages/trips'

  get 'static_pages/fairs'

  get 'static_pages/museums'

  get 'static_pages/search'

  get 'tag/show'

  get 'static_pages/search_model/:id' => 'static_pages#search_model'



 # get 'propositions/new'

 # post 'propositions/create'

 # resources :propositions
  resources :propositions, only: [:new, :create, :show]

 #get 'propositions/new'
 # get 'propositions/create'
  #get 'propositions/index'
  match '/propositions', to: 'propositions#new', via: 'get'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  resources :attractions

  resources :categories

  resources :regions

  resources :tag

  resources :varieties



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
  get "*any", via: :all, to: "error#not_found"
end


