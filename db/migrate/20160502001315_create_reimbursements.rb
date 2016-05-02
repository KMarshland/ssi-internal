class CreateReimbursements < ActiveRecord::Migration
  def change
    create_table :reimbursements do |t|
      t.string :status, index: true
      t.string :team, index: true
      t.boolean :credit_card
      t.decimal :value, precision: 8, scale: 2
      t.text :description

      t.timestamps null: false
    end
  end
end
