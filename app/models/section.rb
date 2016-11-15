class Section < ApplicationRecord
  belongs_to :subject

  # define scopes for incomplete and sorted sections (default order is from latest)
  default_scope      -> { order(id: :desc) }
  scope :incomplete, -> { where(complete: false) }
  scope :complete,   -> { where(complete: true) }

  # long version of scope :incomplete, with limit (first n)
  # def self.find_incomplete(limit)
  #   # there's no need to prepend with Section as this is already scoped inside Section class
  #   where(complete: false).order('id DESC').limit(limit)
  # end

end
