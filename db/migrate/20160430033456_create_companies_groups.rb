class CreateCompaniesGroups < ActiveRecord::Migration
  def change
    create_table :companies_groups do |t|
      t.references :company
      t.references :group
    end

    add_index :companies_groups, [:company_id, :group_id]
    add_index :companies_groups, :company_id
    add_index :companies_groups, :group_id
  end
end
