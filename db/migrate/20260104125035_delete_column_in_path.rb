class DeleteColumnInPath < ActiveRecord::Migration[8.1]
  def change
    remove_column :paths, :user_ids
  end
end
