Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  resources :reviews
  resources :categories, only: :show
  resources :tours, only: :show
  post "/rate" => "rater#create", :as => "rate"
  ActiveAdmin.routes self
  get "/static_pages/*page", to: "static_pages#show"
  root "static_pages#home"
  devise_for :user,
    controllers: {omniauth_callbacks: :"omniauth_callbacks#create" }

  resources :tours, only: [:index, :show] do
    resources :bookings
    post "bookings/:id" => "bookings#show"
  end
end
