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

  resource :mypage, except: %i[index show new create edit update destroy] do
    collection do
      get :profile
      get :evaluation_comments
      get :sell_items
      get :buy_items
    end
  end

  controller :static_pages do
    get :sell_guide # 出品ガイド
    get :buy_guide # 購入ガイド
    get :contact # 問い合わせ
    get :privacy_policy # プライバシーポリシー
    get :terms_of_service # 利用規約
    get :news # お知らせ
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
