class AddCurrencyToCards < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :currency, :string
  end
end
