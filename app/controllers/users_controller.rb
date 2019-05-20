class UsersController < ApplicationController
  before_action :authenticate_user!

  def mypage
    gon.user = current_user
  end

  def evaluation_comments
    gon.eval_comments = current_user.evaluation_comments
  end
end
