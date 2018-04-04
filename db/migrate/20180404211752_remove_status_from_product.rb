class RemoveStatusFromProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :status

  end
end
