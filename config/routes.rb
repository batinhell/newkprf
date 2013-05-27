Newkprf::Application.routes.draw do
  
  
  resources :documents


  get "documents/index"

  get "search/index"

  resources :banners


  get "test/index"

  resources :departments

  resources :site

  root :to => 'site#index'

  resources :videos


  resources :albums do
    resources :photos
  end


  resources :agits


  resources :members


  resources :pages

  mount Ckeditor::Engine => '/ckeditor'

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :posts

  #match '/' => 'site#index'

  mount Ckeditor::Engine => "/ckeditor"
  
end
