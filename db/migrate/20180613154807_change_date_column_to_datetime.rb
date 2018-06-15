class ChangeDateColumnToDatetime < ActiveRecord::Migration[5.1]
  def change
    change_column :interviews, :date, :datetime
    rename_column :interviews, :date, :datetime
  end
end
