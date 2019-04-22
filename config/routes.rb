# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations'
  }
  root controller: 'items', action: 'index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
