class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :price
      t.string :model_code
      t.string :memory
      t.string :color
      t.string :status
      t.string :photo
      t.string :description
      t.string :category
      t.string :product_type
      t.string :version
      t.integer :owner_id, foreign_key: true
      t.integer :buyer_id, foreign_key: true

      t.timestamps
    end
  end
end
