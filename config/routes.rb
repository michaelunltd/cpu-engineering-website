Rails.application.routes.draw do
  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'home#index', as: 'home'
  get 'articles/index', as: 'articles'
  get 'articles/:id/toggle_featured' => 'articles#toggle_featured', as: 'toggle_featured'

  get '/researches' => 'researches#show_all', as: "show_all_researches"
  get '/curriculums'=> 'curriculums#show_all', as: "show_all_curriculums"
  resources :news

  resources :events

  resources :departments do
    resources :researches
    resources :curriculums
  end

  resources :organizations

  resources :linkages

  resources :employees
  resources :facilities
  resources :outreach_programs
  resources :graduates
  resources :laboratories
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
end
