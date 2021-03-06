class UsersController < ApplicationController

  before_action :authenticate_user!, except: %i[show]

  def show
    gon.user = User.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      return redirect_to profile_mypage_path, notice: '編集しました'
    else
      return redirect_to profile_mypage_path, alert: '編集に失敗しました'
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile)
  end
end
