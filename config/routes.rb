Rails.application.routes.draw do
  namespace :admin do
    resources :comments
resources :follows
resources :forums
resources :posts
resources :static_pages
resources :users

    root to: "comments#index"
  end

  get 'forums/index'

  get 'forums/show'

  get 'forums/new'

  get 'forums/edit'

  mount Ckeditor::Engine => '/ckeditor'
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
  
  root "static_pages#home"
  get 'profile', to: "static_pages#profile"
  get 'users', to: "users#index", as: "users"
  get 'users/:id', to: "users#show", as: "user"
  get 'major', to: "users#major",as: :major
  get 'terms', to: "static_pages#terms"
  get 'papermajor', to: "posts#papermajor"
  get 'forummajor', to: "forums#forummajor"
  get 'dashboard', to:"static_pages#dashboard"
  get 'auth/facebook', as: "login"
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'logout'   => 'sessions#destroy', as: "logout"
  
  get 'users/:id/edit', to: "users#edit", as: "edit_user"
  patch 'users/:id', to: "users#update"
  
  
  resources :users do
    resources :upvotes, only: :create
    resources :downvotes, only: :create
    resources :comments
  end
  
  resources :users do
  member do
    get 'clip', to: "users#clip"
    get 'show_pdf', to: "users#show_pdf" 
    get :follow
    post :follow
    get :unfollow
    get 'friends', to: "users#friends"
    post 'friends', to: "users#friends"
    put "like", to: "users#upvote"
    put "dislike", to: "users#downvote"
        end
  end
  
  resources :posts do
  resources :comments
  end
  
  resources :posts do 
    member do
      get 'like', to: "posts#like"
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end

  resources :forums do 
    member do
      get 'like', to: "forums#like"
      put "like", to: "forums#upvote"
      put "dislike", to: "forums#downvote"
    end
  end
  
  resources :comments do
    member do
      put "like", to: "comments#upvote"
      put "dislike", to: "comments#downvote"
    end
  end
  
  resources :forums do
  resources :comments
  end
  
end
