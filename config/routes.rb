Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html




  namespace :api, defaults: {format: :json} do

    resources :users, only: [:create]
    
    resource :session, only: [:create, :show, :destroy]

    resources :listings, only: [:show, :index]

    post 'users/check', to: 'users#check'
    
  end

  
  get '*path', to: "static_pages#frontend_index"
end
