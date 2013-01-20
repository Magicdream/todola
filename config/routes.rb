Todola::Application.routes.draw do
  devise_for :users

  root to: 'tasks#index'
end
