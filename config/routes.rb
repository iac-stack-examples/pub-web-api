Rails.application.routes.draw do
  resources :tasks, only: [:index]

  get '/healthz', to: 'application#healthz'

  root "tasks#index"
end
