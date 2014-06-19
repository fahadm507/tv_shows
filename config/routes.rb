TvShows::Application.routes.draw do
  resources :television_shows, only: [:index, :show, :new, :create]
  resources :television_shows do
    resources :characters, only: :create
  end
  resources :characters, only: [:index, :destroy]
end
