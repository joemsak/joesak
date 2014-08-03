class AddSlugToProfiles < ActiveRecord::Migration
  def change
    change_table :profiles do |t|
      t.string :slug, null: false
      t.index :slug, unique: true
    end
  end
end
