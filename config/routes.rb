Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'signup' }

  root 'users#show'

  get '/users/:id' => 'users#show'

  get '/clients' => 'clients#index'
  get '/clients/new' => 'clients#new'
  post '/clients' => 'clients#create'
  get '/clients/:id' => 'clients#show'
  get '/clients/:id/edit' => 'clients#edit'
  patch '/clients' => 'clients#update'
  delete 'clients/:id' => 'clients#destroy'
  get '/forms' => 'clients#forms'

  get '/clients/:id/casenotes' => 'case_notes#index'
  get '/clients/:id/casenotes/new' => 'case_notes#new'
  post '/clients/:id/casenotes' => 'case_notes#create'
  get 'clients/casenotes/:id' => 'case_notes#show'
  get 'clients/casenotes/:id/edit' => 'case_notes#edit'
  patch 'clients/:id/casenotes' => 'case_notes#update'
  delete 'clients/casenotes/:id' => 'case_notes#destroy'

  get '/users/:id/comment_form' => 'comments#new'
  post '/users/:id/comments' => 'comments#create'

  get ''
end
