Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope(:path_names => { :new => "nueva", :edit => "editar" }) do
    resources :entries, :path => 'quejas'
  end
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  get '/logout' => 'sessions#destroy'
  get '/login' => 'sessions#login'

  
  root :to => 'entries#index'
end
