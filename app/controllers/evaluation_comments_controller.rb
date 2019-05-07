class EvaluationCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    item = Item.find(params[:item_id])
    comment = EvaluationComment.new(evaluation_comment_params)
    if comment.save
      item.update(trading_status: :completed)
      return redirect_to item_path(item), notice: "評価が完了しました"
    else
      return redirect_to trading_item_path(item), alert: "評価の投稿に失敗しました。"
    end
  end

  private

  def evaluation_comment_params
    params[:evaluation_comment][:status] = params[:evaluation_comment][:status].to_i
    params.require(:evaluation_comment).permit(:user_id, :status, :comment)
  end
end
