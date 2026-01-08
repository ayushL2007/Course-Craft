class RenameRelationKeys < ActiveRecord::Migration[8.1]
  def change
    rename_column :path_infos, :paths_id, :path_id
    rename_column :roadmaps, :path_infos_id, :path_info_id
    rename_column :paths, :users_id, :user_id
  end
end
