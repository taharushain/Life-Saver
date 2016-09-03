Rails.application.routes.draw do


  get "/admins/log_out" => "admin_sessions#destroy", :as => "log_out"
  get "/admins/log_in" => "admin_sessions#new", :as => "log_in"
  get "/admins/sign_up" => "admins#new", :as => "sign_up"
  get "/admins/home" => "hospitals#index", :as => "admin_home"

  get "/admins/ambulance_users" => "ambulance_users#index", :as => :ambulance_users
  get "/admins/ambulance_users/add" => "ambulance_users#new", :as => :ambulance_user_add
  post "/admins/ambulance_users" => "ambulance_users#create"
  get "/admins/ambulance_users/:id" => "ambulance_users#show", :as => :ambulance_user
  get "/admins/ambulance_users/:id/edit" => "ambulance_users#edit", :as => :ambulance_user_edit
  patch "/admins/ambulance_users/:id/" => "ambulance_users#update"
  put "/admins/ambulance_users/:id/" => "ambulance_users#update"
  delete "/admins/ambulance_users/:id/" => "ambulance_users#destroy"


  get "/hospital_super_users/log_out" => "hospital_super_user_sessions#destroy", :as => "hospital_super_user_log_out"
  get "/hospital_super_users/log_in" => "hospital_super_user_sessions#new", :as => "hospital_super_user_log_in"
  get "/admins/hospital_super_users/add" => "hospital_super_users#new", :as => :hospital_super_user_add
  post "/admins/hospital_super_users/add" => "hospital_super_users#create"
  get "/super_users/home" => "hospital_super_users#index", :as => "hospital_super_user_home"

  get "/log_out" => "manager_sessions#destroy", :as => "manager_log_out"
  get "/log_in" => "manager_sessions#new", :as => "manager_log_in"
  get "/super_users/managers/add" => "managers#new", :as => :manager_add
  post "/super_users/managers/add" => "managers#create"
  get "/" => "managers#index", :as => "root"


  get "/super_users/beds" => "beds#index", :as => :beds
  get "/super_users/beds/add" => "beds#new", :as => :bed_add
  post "/super_users/beds/" => "beds#create"
  # get "/super_users/beds/:id" => "beds#show", :as => :bed
  # get "/super_users/beds/:id/edit" => "beds#edit", :as => :bed_edit
  # patch "/super_users/beds/:id/" => "beds#update"
  # put "/super_users/beds/:id/" => "beds#update"
  # delete "/super_users/beds/:id/" => "beds#destroy"

  get "/requests" => "requests#index", :as => :requests
  get "/requests/:id" => "requests#show", :as => :request_show
  get "/history" => "requests#history", :as => :request_history
  patch "/requests/:id" => "requests#update"
  put "/requests/:id" => "requests#update_details"
  

  # get '/' => 'hospitals#home', as: :root
  resources :hospitals, :path => "/admin/hospitals"
  resources :patients, :path => "/admin/patients"

  resources :admins
  resources :admin_sessions

  resources :hospital_super_users
  resources :hospital_super_user_sessions

  resources :managers
  resources :manager_sessions
  
  
  # API routes path
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sessions, only: [:create, :destroy]
      resources :ambulance_users, only: [:show]
      resources :requests, only: [:index, :create, :show, :update, :destroy]
      resources :request_details, only: [:index, :create, :show, :update, :destroy]
    end
  end  

  # resources :hospital_super_users
  # resources :hospital_super_user_sessions
  
  # resources :hospitals  
  # root 'home#index'  

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
end
