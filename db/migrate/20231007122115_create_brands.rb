class CreateBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.boolean :active
      t.string :redemption

      t.timestamps
    end
    add_index :brands, :name, unique: true
  end
end
