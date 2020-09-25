Rails.application.routes.draw do
  devise_for :users
  root to: "issues#index"
  resources :issues, only:[:index]
  resources :users, only:[:index, :show]
  resources :products, only:[:new, :create, :edit, :update] do
    resources :issues, only:[:new, :create, :edit, :update, :destroy] do
      resources :tasks, only:[:new, :create, :edit, :update, :destroy] do
      end
    end
  end
end
