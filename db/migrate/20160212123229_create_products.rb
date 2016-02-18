class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :count_in_stock
      t.float :price

      t.timestamps null: false
    end
  end
end
