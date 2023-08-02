Rails.application.routes.draw do
  # get 'home/index'
  # get 'welcome/index'
  
  # root 'welcome#index'
  root 'home#index' 

  # get 'home/form'

  get '/user_details', to: 'home#form'
  post '/user_details', to: 'home#create_form'

  get '/address_details', to: 'home#address'
  post '/address_details', to: 'home#create_address'

  get '/office_details', to: 'home#office'
  post '/office_details', to: 'home#create_office'


  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'   
    end  

    get 'home/index', to: 'home#index', as: :search
end
