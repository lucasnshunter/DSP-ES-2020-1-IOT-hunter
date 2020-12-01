Rails.application.routes.draw do
  resources :logs
  resources :farms
  post 'logs/sends'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
