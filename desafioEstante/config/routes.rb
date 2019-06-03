Rails.application.routes.draw do
  resources :competitions, only: [:create]
  resources :results, only: [:create]
  match 'competition/end', to:'competitions#end_competition', via: 'post'
  match 'competition/ranking', to:'competitions#ranking', via: 'post'
end
