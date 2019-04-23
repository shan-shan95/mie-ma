# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :is_signed_in

  protected

  def is_signed_in
    gon.is_signed_in = user_signed_in?
  end
end
