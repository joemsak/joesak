class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.string :title
      t.text :content
      t.references :profile, index: true

      t.timestamps
    end
  end
end
