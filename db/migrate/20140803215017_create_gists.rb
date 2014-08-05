class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.references :profile, index: true, null: false
      t.string :remote_id, null: false
      t.index :remote_id, unique: true

      t.timestamps
    end
  end
end
