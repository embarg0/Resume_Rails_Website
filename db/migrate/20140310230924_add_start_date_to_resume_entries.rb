class AddStartDateToResumeEntries < ActiveRecord::Migration
  def change
    add_column :resume_entries, :start_date, :date
  end

  #def up
  #	add_column :resume_entries, :start_date, :date
  #end

  #def down
  #	remove_column :resume_entries, :start_date
  #end
end
