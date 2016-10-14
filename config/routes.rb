Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  resources :reviews
  ActiveAdmin.routes self
  get "/static_pages/*page" => "static_pages#show"
  root "static_pages#home"
  devise_for :users
end
