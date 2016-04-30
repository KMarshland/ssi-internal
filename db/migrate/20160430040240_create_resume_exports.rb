class CreateResumeExports < ActiveRecord::Migration
  def change
    create_table :resume_exports do |t|
      t.string :link, index: true
      t.string :uri

      t.timestamps null: false
    end
  end
end
