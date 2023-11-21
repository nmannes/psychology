# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  get '/lab' => 'tests#show'
  get '/lab/begin' => 'tests#begin'

  post '/lab/begin' => 'tests#demographics'

  get '/tests' => 'tests#list'
  get '/lab/test/:id' => 'tests#conduct'
  post 'lab/test/:id' => 'tests#add_word'

  put 'lab/test/:id' => 'tests#next_stage'
  put 'lab/test/auditory-stage-7/:id' => 'tests#stage7'

  delete 'lab/test/:id' => 'tests#delete_entry'
end
