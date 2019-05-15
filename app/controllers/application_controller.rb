class ApplicationController < ActionController::Base
  before_action :signed_in_gon

  def render(*args, &block)
    gon.notice = flash[:notice]
    gon.alert = flash[:alert]
    super
  end

  protected

  def signed_in_gon
    gon.is_signed_in = user_signed_in?
  end
end
