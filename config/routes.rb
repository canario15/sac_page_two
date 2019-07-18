Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pages#home'

  get '/noticias', to: 'pages#news', as: 'notice'
  get '/categorias', to: 'pages#categories', as: 'categories'
  get '/galerias', to: 'pages#galleries', as: 'galleries'
  get '/nosotros', to: 'pages#about', as: 'about'
  get '/contacto', to: 'pages#contact', as: 'contact'

  get '/categorias/:id/sub_categories', to: 'categories#sub_categories',
                                        as: :sub_categories

  get '/categorias/:id/pilots', to: 'categories#pilots',
                                as: :category_pilots

  put '/race/:id/close', to: 'application#close_race', as: :close_race
end
