class RemoveAndUpdateColumnInPath < ActiveRecord::Migration[8.1]
  def change
    remove_column :paths, :info_link, :string
  end
end
