Rails.application.routes.draw do
  resources :restaurants, only: %i[index show create new] do
    resources :reviews, only: %i[new create]
  end
end
