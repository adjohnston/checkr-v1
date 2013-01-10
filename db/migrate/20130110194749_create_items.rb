class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :desc
      t.string :url
      t.boolean :is_checked, default: false
      t.integer :list_id

      t.timestamps
    end
  end
end
