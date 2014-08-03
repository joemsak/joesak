class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.references :profile, index: true
      t.integer :remote_id, index: true, unique: true, null: false

      t.timestamps
    end
  end
end
