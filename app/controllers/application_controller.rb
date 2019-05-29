class ApplicationController < ActionController::Base
  before_action :signed_in_gon, :current_user_gon

  def render(*args, &block)
    gon.notice = flash[:notice]
    gon.alert = flash[:alert]
    super
  end

  protected

  def signed_in_gon
    gon.is_signed_in = user_signed_in?
  end

  def current_user_gon
    gon.current_user = current_user.slice(:id, :nickname) if user_signed_in?
  end
end
