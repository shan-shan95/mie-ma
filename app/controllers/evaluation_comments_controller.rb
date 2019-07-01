class EvaluationCommentsController < ApplicationController
  before_action :authenticate_user!
  after_action :send_evaluated_mail, only: %i[create]

  def create
    @item = Item.find(evaluation_comment_params[:item_id])

    return redirect_to trading_item_path(@item), alert: "既に評価の投稿が完了しています" if current_user.is_completed_evaluation?(@item)

    @comment = EvaluationComment.create(evaluation_comment_params)
    if @comment
      return redirect_to item_path(@item), notice: "評価が完了しました"
    else
      return redirect_to trading_item_path(
        @item), alert: "評価の投稿に失敗しました"
    end
  end

  private

  def evaluation_comment_params
    params.require(:evaluation_comment).permit(:evaluator_id, :be_evaluated_id, :evaluator_type, :item_id, :status, :comment)
  end

  def send_evaluated_mail
    return if @comment.nil?
    ClientMailer.with(user: @comment.be_evaluated, item: @item).evaluated_for_be_evaluated_user.deliver_later
    ClientMailer.with(user: @comment.be_evaluated, item: @item).evaluated_for_evaluator.deliver_later
  end
end
