class RenameUserIdToAskerIdOnQuestions < ActiveRecord::Migration[5.1]
  def change
    rename_column :questions, :user_id, :asker_id
  end
end
