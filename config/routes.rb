Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
    resources :comments, only: [:create]
  end

  resources :articles do
    resources :comments, only: [:create]
  end


  resources :comments, only: [:show, :edit, :update, :destroy]

end
