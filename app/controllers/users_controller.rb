class UsersController < ApplicationController
  before_action :authenticate_user!

  def mypage
    gon.user = current_user
  end
end
