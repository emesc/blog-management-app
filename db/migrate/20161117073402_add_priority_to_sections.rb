class AddPriorityToSections < ActiveRecord::Migration[5.0]
  def change
    add_column :sections, :priority, :integer
  end
end
