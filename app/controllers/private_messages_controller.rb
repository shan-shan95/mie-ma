class PrivateMessagesController < ApplicationController
  include ResponseStatus

  before_action :authenticate_user!

  def create
    item = Item.find(params[:item][:id])
    return response_unauthorized until current_user.is_trader?(item)

    message = PrivateMessage.new(message_params)
    if message.save
      render status: 200, json: message.to_json
    else
      response_internal_server_error
    end
  end

  private

  def message_params
    params.require(:private_message).permit(:content, :sender_id, :item_id, :receiver_id)
  end
end
