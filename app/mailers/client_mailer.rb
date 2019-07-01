class ClientMailer < ApplicationMailer
  def purchased_for_buyer
    @user = params[:user]
    @item = params[:item]
    mail(to: @user.email, subject: '【ミエマ】商品の購入が完了しました')
  end

  def purchased_for_seller
    @user = params[:user]
    @item = params[:item]
    mail(to: @user.email, subject: '【ミエマ】出品していた商品が購入されました')
  end

  def evaluated_for_be_evaluated
    @user = params[:user]
    @item = params[:item]
    mail(to: @user.email, subject: '【ミエマ】取引きが評価されました')
  end

  def evaluated_for_evaluator
    @user = params[:user]
    @item = params[:item]
    mail(to: @user.email, subject: '【ミエマ】取引きを評価しました')
  end
end
