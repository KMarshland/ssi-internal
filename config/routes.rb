Rails.application.routes.draw do

  resources :reimbursements

  post 'upload' => 'file_uploads#upload'

  get 'groups/:id/resumes' => 'groups#resume_link'
  get 'companies/:id/resumes' => 'companies#resume_link'
  get 'resume-book/:link' => 'resumes#export'

  put 'groups/:id/company' => 'groups#company'
  resources :companies
  resources :groups

  post 'resumes/upload'
  resources :resumes

  root 'static#home'

  get 'users/current'
  put 'users/:id/role' => 'users#role'
  put 'users/:id/group' => 'users#group'
  get 'permissions' => 'users#no_permissions', as: :permissions
  resources :users
  get 'signin' => 'sessions#signin'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :delete]

  resources :sessions, only: [:create, :destroy]

  get ':name' => 'companies#external'

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
