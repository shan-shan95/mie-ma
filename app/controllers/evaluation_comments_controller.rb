class EvaluationCommentsController < ApplicationController
  include ResponseStatus

  before_action :authenticate_user!

  def create
    comment = EvaluationComment.new(evaluation_comment_params)
    if comment.save
      return render status: 200, json: comment.to_json
    else
      return response_internal_server_error
    end
  end

  private

  def evaluation_comment_params
    params.require(:evaluation_comment).permit(:user_id, :status, :comment)
  end
end
