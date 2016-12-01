class ChangeDeadlineToDatetime < ActiveRecord::Migration[5.0]
  def change
    change_column :sections, :deadline, :datetime
  end
end
