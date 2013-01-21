Todola::Application.routes.draw do
  devise_for :users

  namespace :api do
    resources :tokens, only: [:create, :destroy]
    
    resources :tasks do
      member do
        put :complete, :uncomplete
      end
    end
  end

  resources :tasks do
    member do
      post :toggle_complete
    end
  end

  root to: 'pages#index'
end
