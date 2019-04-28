class TradingMessagesController < ApplicationController
  include ResponseStatus

  before_action :authenticate_user!

  def create
    message = TradingMessage.new(message_params)
    if message.save
      response_success(controller_name, action_name)
    else
      response_internal_server_error
    end
  end

  private

  def message_params
    params.require(:trading_message).permit(:content, :buyer_id, :seller_id, :item_id, :open_range)
  end
end
