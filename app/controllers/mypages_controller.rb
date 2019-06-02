class MypagesController < ApplicationController
  before_action :authenticate_user!

  def profile
    gon.user = current_user
  end

  def evaluation_comments
    gon.eval_comments = current_user.evaluation_comments.map(&:evaluator_name)
  end

  def sell_items
    gon.sell_items = current_user.sell_items.map(&:with_sumbnail_url)
  end

  def buy_items
    gon.buy_items = current_user.buy_items.map(&:with_sumbnail_url)
  end
end
