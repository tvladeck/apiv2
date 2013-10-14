Apiv2::Application.routes.draw do

  resources :dashboards
  
  get '/outside/create',  to: 'outside_data_sources#create',    as: 'outside'
  get '/outside/summary', to: 'outside_data_sources#summarize', as: 'summary'

end
