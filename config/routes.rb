Rails.application.routes.draw do
  # get 'article/index'
  # get 'article/show'
  # get 'article/create'
  # get 'article/update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :article
end
