Rails.application.routes.draw do
  root 'habits#new'

  resources :habits, only: [:create, :show]
  get 'habits/:id/confirm/:token', to: 'habits#confirm', as: :confirm_habit
end
