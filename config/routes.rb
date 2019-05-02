Rails.application.routes.draw do
  devise_for :users, controllers: {
                       confirmations: "users/confirmations",
                       registrations: "users/registrations",
                       sessions: "users/sessions",
                       passwords: "users/passwords",
                     }

  root controller: "items", action: "index"

  resources :items, except: :index do
    member do
      patch :purchase
      get :trading
    end
  end

  resources :public_messages, only: %i[index create]

  resources :private_messages, only: %i[index create]

  resources :evaluation_comments, only: :create

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
