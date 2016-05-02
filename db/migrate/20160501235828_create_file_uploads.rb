class CreateFileUploads < ActiveRecord::Migration
  def change
    create_table :file_uploads do |t|
      t.string :name, index: true
      t.integer :size
      t.string :uri
      t.string :url

      t.timestamps null: false
    end
  end
end
