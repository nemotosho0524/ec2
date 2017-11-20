class AddLinePriceToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :line_price, :integer
  end
end
