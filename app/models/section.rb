class Section < ApplicationRecord
  belongs_to :subject, counter_cache: true
  has_many :comments

  validates_with DatetimeValidator

  # define scopes for incomplete and sorted sections (default order is from latest)
  # default_scope      -> { order(id: :desc) }
  # default_scope      -> { order(deadline: :asc).order(priority: :asc) }
  scope :important,    -> { order(deadline: :asc).order(priority: :asc) }
  scope :incomplete,   -> { where(complete: false) }
  scope :complete,     -> { where(complete: true) }#.order(title: :asc) }
  scope :alphabetical, -> { order(title: :asc) }

  # long version of scope :incomplete, with limit (first n)
  # def self.find_incomplete(limit)
  #   # there's no need to prepend with Section as this is already scoped inside Section class
  #   where(complete: false).order('id DESC').limit(limit)
  # end

  def self.search_for(keyword)
    where("sections.title LIKE ? OR sections.body LIKE ?", "%#{keyword}%", "%#{keyword}%")
  end

end
