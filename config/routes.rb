Rails.application.routes.draw do
  root 'habits#new'

  resources :habits, only: [:create, :show]
  get 'habits/:id/confirm/:token', to: 'habits#confirm', as: :confirm_habit

  get 'entries/:id/log-success', to: 'entries#log_success', as: :log_success_for_entry
  get 'entries/:id/log-failure', to: 'entries#log_failure', as: :log_failure_for_entry
end
