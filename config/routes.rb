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

  get "sell_guide", to: "static_pages#sell_guide" # 出品ガイド
  get "buy_guide", to: "static_pages#buy_guide" # 購入ガイド
  get "contact", to: "static_pages#contact" # 問い合わせ
  get "privacy_policy", to: "static_pages#privacy_policy" # プライバシーポリシー
  get "terms_of_service", to: "static_pages#terms_of_service"  # 利用規約
  get "news", to: "static_pages#news" # お知らせ

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
