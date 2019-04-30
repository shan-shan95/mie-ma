class AddReceiverIdToPrivateMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :private_messages, :receiver_id, :string, null: false
    add_column :private_messages, :is_already_read, :boolean, null: false, default: false
  end
end
