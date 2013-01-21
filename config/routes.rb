Todola::Application.routes.draw do
  devise_for :users

  resources :tasks do
    member do
      post :toggle_complete
    end
  end

  root to: 'pages#index'
end
