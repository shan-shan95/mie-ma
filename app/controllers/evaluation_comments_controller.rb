class EvaluationCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    item = Item.find(params[:item_id])
    if EvaluationComment.create(evaluation_comment_params)
      item.update(trading_status: :completed)
      return redirect_to item_path(item), notice: "評価が完了しました"
    else
      return redirect_to trading_item_path(item), alert: "評価の投稿に失敗しました。"
    end
  end

  private

  def evaluation_comment_params
    params.require(:evaluation_comment).permit(:seller_id, :buyer_id, :status, :comment)
  end
end
