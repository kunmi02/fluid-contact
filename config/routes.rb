Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'api/users/signin', to: 'authentication#authenticate'
  post 'api/users/signup', to: 'users#create'
end
