class AddPathToUser < ActiveRecord::Migration[8.1]
  def change
    add_belongs_to :paths, :users, foreign_key: true
  end
end
