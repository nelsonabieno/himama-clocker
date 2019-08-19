Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/user'=>'users#create'
  post '/login' => 'users#login'
  get '/logout' => 'users#logout'
  get '/user' => 'users#new'
  get '/dashboard' => 'users#home'
  get '/clockin' => 'clock_events#clock_in'
  get '/clockout' => 'clock_events#clock_out'
  get '/clockevents' => 'clock_events#index'
  get '/userclockevent' => 'clock_events#show'
  get '/edituserclockevent' => 'clock_events#edit'
  post '/edituserclockevent' => 'clock_events#update'
  delete '/userclockevent' => 'clock_events#destroy'
  root 'home#index'
end
