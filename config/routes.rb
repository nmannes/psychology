Rails.application.routes.draw do
  devise_for :users
  
  root "home#index"
  
  get '/lab' => 'tests#show'
  get '/lab/begin' => 'tests#begin'
  
  post '/lab/begin' => 'tests#demographics'
  
  get '/lab/test/:id' => 'tests#conduct'
  post 'lab/test/:id' => 'test#add_word'
  delete 'lab/test/:id' => 'tests#delete_entry'

end
