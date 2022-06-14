class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.belongs_to :user, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.timestamps
    end
  end
end
