Rails.application.routes.draw do
  # get 'home/index'
  # get 'welcome/index'
  
  # root 'welcome#index'
  root 'home#index' 

  # get 'home/form'

  get '/form', to: 'home#form'
  post '/form', to: 'home#create_form'

  get '/address', to: 'home#address'
  post '/address', to: 'home#create_address'

  get '/office', to: 'home#office'
  post '/office', to: 'home#create_office'


  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'   
    end  

    get 'home/index', to: 'home#index', as: :search
end
