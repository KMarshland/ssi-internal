class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, index: true

      t.timestamps null: false
    end
  end
end
