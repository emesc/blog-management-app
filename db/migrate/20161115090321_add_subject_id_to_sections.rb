class AddSubjectIdToSections < ActiveRecord::Migration[5.0]
  def change
    add_column :sections, :subject_id, :integer
  end
end
