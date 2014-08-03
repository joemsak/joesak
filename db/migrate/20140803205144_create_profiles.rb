class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username, null: false
      t.string :name
      t.index :username, unique: true

      t.timestamps
    end
  end
end
