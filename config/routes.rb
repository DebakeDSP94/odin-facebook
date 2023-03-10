Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"

  devise_scope :member do
    get "member", to: "devise/sessions#new"
  end

  devise_for :members,
             path: "",
             path_names: {
               sign_in: "login",
               sign_out: "logout",
               sign_up: "register"
             }

  as :member do
    get ":member/edit-profile" => "devise/registrations#edit",
        :as => :edit_member_profile
  end

  shallow do
    resources :posts do
      resources :comments
    end
  end

  resources :likes, only: %i[create destroy]
end
