class AddColumnToInterviews < ActiveRecord::Migration[5.1]
  def change
    add_column :interviews, :date, :date
    add_column :interviews, :status, :integer
    add_column :interviews, :user_id, :integer
  end
end
