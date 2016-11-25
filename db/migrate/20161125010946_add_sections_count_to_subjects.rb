class AddSectionsCountToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :sections_count, :integer, default: 0

    Subject.reset_column_information
    Subject.all.each do |s|
      s.update_attribute(:sections_count, s.sections.length)
    end
  end
end
