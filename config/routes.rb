Rails.application.routes.draw do

  root to: 'users#home'
  scope :api do
    post 'user/signin', to: 'authentication#authenticate'
    post 'user/signup', to: 'users#create'
    resources :contacts do 
      member do
        patch '/star', to: 'contacts#star_contact'
      end
      collection do
        get 'starred-contacts', to: 'contacts#starred'
      end
    end
  end
end
