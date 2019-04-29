class PublicMessagesController < ApplicationController
  include ResponseStatus

  before_action :authenticate_user!

  def create
    message = PublicMessage.new(message_params)
    if message.save
      render status: 200, json: message.to_json
    else
      response_internal_server_error
    end
  end

  private

  def message_params
    params.require(:public_message).permit(:content, :sender_id, :item_id)
  end
end
