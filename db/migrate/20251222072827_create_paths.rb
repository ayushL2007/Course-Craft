class CreatePaths < ActiveRecord::Migration[8.1]
  def change
    create_table :paths do |t|
      t.string :title
      t.text :description
      t.string :user_ids
      t.string :info_link

      t.timestamps
    end
  end
end
