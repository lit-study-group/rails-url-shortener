UrlShortener::Application.routes.draw do
  root to: 'sites#new'
  get '/:token', to: 'sites#redirect', as: :redirect
  resources :sites, only: [:show, :create]
end
