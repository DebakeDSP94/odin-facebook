class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.references :request_sender,
                   index: true,
                   foreign_key: {
                     to_table: :members
                   }
      t.references :request_receiver,
                   index: true,
                   foreign_key: {
                     to_table: :members
                   }
      t.timestamps
    end
  end
end
