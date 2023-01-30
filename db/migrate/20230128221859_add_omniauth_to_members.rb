class AddOmniauthToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :provider, :string
    add_column :members, :uid, :string
  end
end
