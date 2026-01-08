class CreateCertificates < ActiveRecord::Migration[8.1]
  def change
    create_table :certificates do |t|
      t.binary :pdf_data
      t.string :pdf_hash

      t.timestamps
    end
  end
end
