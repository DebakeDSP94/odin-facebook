class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :member, null: false, foreign_key: true
      t.string :notification_type
      t.timestamps
    end
  end
end
