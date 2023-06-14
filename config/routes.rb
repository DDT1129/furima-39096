Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "markets#index"
  resources :markets, only: [:index, :new, :create, :show, :edit]
end
