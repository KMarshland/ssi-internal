class AddPrimaryResumeToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :primary_resume, index: true
  end
end
