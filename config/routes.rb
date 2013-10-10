Apiv2::Application.routes.draw do

  resources :dashboards
  
  get '/outside', to: 'outside_data_sources#create', as: 'outside'

end
