Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    member do
      get :events
    end
  end
  resources :events

  get 'users/:id/events' => 'users#events', :as => :user_events

  get 'edit' => 'users#edit'
  post  'edit'   => 'users#update'

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
