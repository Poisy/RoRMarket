class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :amount
      t.references :brand, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
    add_index :products, :name, unique: true
  end
end
