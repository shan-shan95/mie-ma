class EvaluationCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    item = Item.find(params[:item_id])
    comment = EvaluationComment.new(evaluation_comment_params)
    if comment.save
      item.update(trading_status: :completed)
      update_evaluation(params[:evaluation_comment][:seller_id], params[:evaluation_comment][:status])
      return redirect_to item_path(item), notice: "評価が完了しました"
    else
      return redirect_to trading_item_path(item), alert: "評価の投稿に失敗しました。"
    end
  end

  private

  def evaluation_comment_params
    params.require(:evaluation_comment).permit(:seller_id, :buyer_id, :status, :comment)
  end

  def update_evaluation(user_id, status)
    UserEvaluation.create(user_id: user_id) unless User.find(user_id).evaluation.present?
    eval = User.find(user_id).evaluation
    eval.update(status.to_sym => eval[status] + 1)
  end
end
