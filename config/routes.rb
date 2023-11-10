Rails.application.routes.draw do
  devise_for :users
  
  root "home#index"
  
  get '/lab' => 'tests#show'
  get '/lab/begin' => 'tests#begin'
end
