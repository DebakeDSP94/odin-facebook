class CreateMemberProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :member_profiles do |t|
      t.references :member, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :location
      t.string :employer
      t.string :age
      t.string :link
      t.timestamps
    end
  end
end
