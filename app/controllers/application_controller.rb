class ApplicationController < ActionController::Base
  before_action :signed_in?

  protected

  def signed_in?
    gon.is_signed_in = user_signed_in?
  end
end
