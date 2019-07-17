class PrivateMessagesController < ApplicationController
  include ResponseStatus

  before_action :authenticate_user!

  def index
    item = Item.find(params[:item_id])
    return response_unauthorized until current_user.is_trader?(item)

    messages = item.private_messages
    if messages
      return render status: 200, json: messages.to_json
    else
      return response_internal_server_error
    end
  end

  def create
    item = Item.find(params[:item][:id])
    return response_unauthorized until current_user.is_trader?(item)

    message = PrivateMessage.new(message_params)
    if message.save
      ClientMailer.with(user: message.recepient, item: message.item, message: message).received_private_message.deliver_later if message.sender
      return render status: 200, json: message.to_json
    else
      return response_internal_server_error
    end
  end

  private

  def message_params
    params.require(:private_message).permit(:content, :sender_id, :item_id, :recepient_id)
  end
end
