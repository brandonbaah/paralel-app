Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'signup' }

  root 'clients#index'

  get '/clients' => 'clients#index'
  get '/clients/new' => 'clients#new'
  post '/clients' => 'clients#create'
  get '/clients/:id' => 'clients#show'
  get '/clients/:id/edit' => 'clients#edit'
  patch '/clients' => 'clients#update'

  get '/clients/:id/casenotes' => 'case_notes#index'
  get '/clients/:id/casenotes/new' => 'case_notes#new'
  post '/clients/:id/casenotes' => 'case_notes#create'
  get 'clients/casenotes/:id' => 'case_notes#show'
  get 'clients/casenotes/:id/edit' => 'case_notes#edit'
  patch 'clients/:id/casenotes' => 'case_notes#update'
end
