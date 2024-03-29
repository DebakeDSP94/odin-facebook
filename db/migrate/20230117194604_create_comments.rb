class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table(:comments) do |t|
      t.references(:member, null: false, foreign_key: true)
      t.references(:commentable, polymorphic: true, null: false)
      t.text(:body)
      t.timestamps
    end
  end
end
