class AddProductPhotoToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :product_photo, :string
  end
end
