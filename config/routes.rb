Rails.application.routes.draw do
  
  resources :campaigns do
    resources :comments
  end

  devise_for :users

  root 'campaigns#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
