class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :uri

      t.timestamps null: false
    end
    add_foreign_key :resumes, :users
  end
end
