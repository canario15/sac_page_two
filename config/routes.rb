Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  get '/noticias', to: 'pages#news', as: 'notice'
  get '/categorias', to: 'pages#categories', as: 'categories'
  get '/galerias', to: 'pages#galleries', as: 'galleries'
  get '/nosotros', to: 'pages#about', as: 'about'
  get '/contacto', to: 'pages#contact', as: 'contact'

end
