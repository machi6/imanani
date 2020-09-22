Rails.application.routes.draw do
  devise_for :users
  root to: "issues#index"
  resources :issues, only:[:index]
  resources :products, only:[:new, :create] do
    resources :issues, only:[:new, :create]
  end
end
