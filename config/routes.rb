Rails.application.routes.draw do
  root "mangas#index"
  resources :users
  resources :genres
  resources :mangas
  resources :chapters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
