Rails.application.routes.draw do
  devise_for :users
  root to: "issues#index"
  resources :issues, only:[:index]
  resources :users, only:[:index, :show]
  resources :products, only:[:new, :create, :edit] do
    resources :issues, only:[:new, :create] do
      resources :tasks, only:[:new, :create] do
      end
    end
  end
end
