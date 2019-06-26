class UsersController < ApplicationController
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
