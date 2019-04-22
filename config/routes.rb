# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations'
  }
  root controller: 'item', action: 'index'
end
