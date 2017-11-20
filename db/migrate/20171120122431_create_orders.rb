class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.string :order_name
      t.string :tel
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
