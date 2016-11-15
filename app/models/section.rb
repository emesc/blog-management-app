class Section < ApplicationRecord
  belongs_to :subject

  # define scopes for incomplete and sorted sections (default order is from latest)
  default_scope      -> { order(id: :desc) }
  scope :incomplete, -> { where(complete: false) }
  scope :complete,   -> { where(complete: true) }

end
