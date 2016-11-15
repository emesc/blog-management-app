class Section < ApplicationRecord
  belongs_to :subject

  # class method, moved from sections_controller.rb
  def self.find_incomplete
    # there's no need to prepend with Section as this is already scoped inside Section class
    where(complete: false).order('id DESC')
  end
end
