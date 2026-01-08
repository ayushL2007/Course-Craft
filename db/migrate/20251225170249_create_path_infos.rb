class CreatePathInfos < ActiveRecord::Migration[8.1]
  def change
    create_table :path_infos do |t|
      t.text :extended_desc
      t.string :certificate_name
      
      t.timestamps
    end
  end
end
