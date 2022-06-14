class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :country
      t.text :description
      t.integer :stock
      t.string :intensity
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
