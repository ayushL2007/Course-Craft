class AddParentChildRelation < ActiveRecord::Migration[8.1]
  def change
    add_belongs_to :roadmaps, :path_infos, foreign_key: true
    add_belongs_to :path_infos, :paths, foreign_key: true

  end
end
