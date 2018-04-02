class AddForeignkey < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :questions, :courses, column: :same_as_id


  end
end
