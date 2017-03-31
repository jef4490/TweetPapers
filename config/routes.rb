Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'root#index'
  get '/ghost', to: 'root#ghost'

  resources :tweet, only: [:show]

  get '/tweet/:id/:user_id/:count', to: "tweet#user_timeline"

end
