class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :television_show_id, null: false

      t.string :name, null: false
      t.string :actor, null: false
      t.string :description
      t.timestamps
    end
    add_index :characters, [:name, :actor], unique: true
  end
end
