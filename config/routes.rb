Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
end


