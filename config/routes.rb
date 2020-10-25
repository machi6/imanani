Rails.application.routes.draw do
  devise_for :users
  post '/users/guest_sign_in', to: 'users#guest'
  root to: "users#index"
  #resources :issues, only:[:index]
  resources :users, only:[:index]
  resources :users, only:[:show] do
    resources :products, only:[:new, :create, :edit, :update, :destroy] do
      resources :issues, only:[:new, :create, :edit, :update, :destroy] do
        resources :tasks, only:[:new, :create, :edit, :update, :destroy] do
        end
      end
    end
  end
end
