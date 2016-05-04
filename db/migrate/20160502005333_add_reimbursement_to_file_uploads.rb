class AddReimbursementToFileUploads < ActiveRecord::Migration
  def change
    add_reference :file_uploads, :reimbursement, index: true
    add_foreign_key :file_uploads, :reimbursements
  end
end
