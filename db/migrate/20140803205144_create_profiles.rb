class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :name

      t.timestamps
    end
    add_index :profiles, :username
  end
end
