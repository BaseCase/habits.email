Rails.application.routes.draw do
  root 'habits#new'

  resources :habits
end
