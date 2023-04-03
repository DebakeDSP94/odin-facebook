class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table(:friends) do |t|
      t.references(:member, null: false, foreign_key: true)
      t.integer(:friend_id, null: false, foreign_key: true)
      t.timestamps
    end
  end
end
