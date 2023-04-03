class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table(:likes) do |t|
      t.references(:member, null: false, foreign_key: true)
      t.references(:likeable, polymorphic: true, unique: true)
      t.index(%i[member_id likeable_type likeable_id], unique: true)
      t.timestamps
    end
  end
end
