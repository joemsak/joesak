class AddPasswordSaltAndHashToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :password_salt, :string, null: false
    add_column :profiles, :password_hash, :string, null: false
  end
end
