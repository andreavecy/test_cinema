Rails.application.routes.draw do
  resources :reservations
  get '/numbers_reservations' => 'reservations#reservations'
  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
