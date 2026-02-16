Rails.application.routes.draw do
  resources :players, only: [:index, :create, :destroy]
  resources :matches, only: [:create]

  get "/leaderboard", to: "leaderboard#index"
end
