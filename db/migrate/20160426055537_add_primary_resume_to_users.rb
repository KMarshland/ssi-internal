class AddPrimaryResumeToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :primary_resume, index: true
    add_foreign_key :users, :primary_resumes
  end
end
