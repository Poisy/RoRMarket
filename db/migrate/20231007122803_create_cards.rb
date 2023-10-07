class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :status
      t.references :product, null: false, foreign_key: true
      t.float :amount
      t.integer :activation_number

      t.timestamps
    end
    add_index :cards, :activation_number, unique: true
  end
end
