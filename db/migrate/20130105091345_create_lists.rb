class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.text :desc
      t.boolean :is_public, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
