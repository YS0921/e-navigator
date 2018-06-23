class ChangeStatusPendingToInterviews < ActiveRecord::Migration[5.1]
  def change
    change_column :interviews, :status, :integer, default: 0
  end
end
