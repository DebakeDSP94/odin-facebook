Rails.application.routes.draw do
  get "members/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"

  devise_scope :member do
    get "member", to: "members/sessions#new"
  end

  devise_for :members,
             controllers: {
               sessions: "members/sessions",
               registrations: "members/registrations"
             }

  resources :members, only: %i[index show]

  shallow do
    resources :posts do
      resources :comments
    end
  end

  resources :likes, only: %i[create destroy]
end
