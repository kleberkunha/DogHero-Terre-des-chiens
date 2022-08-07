Rails.application.routes.draw do
  resources :dogs
  devise_for :users
  
  resources :users do
    member do
      get :events
    end
  end
  
  resources :events


  get 'users/:id/events' => 'users#events', :as => :user_events

  get 'user/:id/edit', to: 'user#edit', as: 'edit'

  get 'admin', to: 'users#admin_page', as: 'admin'

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
