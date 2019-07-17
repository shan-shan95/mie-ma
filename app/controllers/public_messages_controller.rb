class PublicMessagesController < ApplicationController
  include ResponseStatus

  def index
    messages = Item.find(params[:item_id]).public_messages
    if messages
      return render status: 200, json: messages.to_json
    else
      return response_internal_server_error
    end
  end

  def create
    message = PublicMessage.new(message_params)
    if message.save
      ClientMailer.with(user: message.item.seller, item: message.item, message: message).received_public_message.deliver_later if message.sender != message.item.seller
      return render status: 200, json: message.to_json
    else
      return response_internal_server_error
    end
  end

  private

  def message_params
    params.require(:public_message).permit(:content, :sender_id, :item_id)
  end
end
