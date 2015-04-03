Rails.application.routes.draw do
  root to: 'home#index'
  patch "capture", to: 'pokemons#capture'
  patch "kill", to: 'pokemons#kill'
  post "create", to: 'pokemons#create'
  get "new", to: 'pokemons#new'
  devise_for :trainers
  resources :trainers
end
