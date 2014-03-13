MyHotelFlier::Application.routes.draw do

  match "/404", to: "errors#not_found", via: [:get, :post]

  mount Resque::Server, at: '/resque'

  #use_doorkeeper

  #namespace :api do
  #  api version: 1, module: "v1"  do
  #    resources :hotels, :only => [:show, :update]
  #  end
  #end

  root 'hotels#index', as: 'home'

  resources :hotels do
    resources :hotel_fliers
  end
end
