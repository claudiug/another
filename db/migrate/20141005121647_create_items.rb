class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.boolean :status
      t.text :description
      t.integer :ranking
      t.timestamps
    end
  end
end
