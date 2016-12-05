class Product < ApplicationRecord
  belongs_to :user
  has_many :categorisations
  has_many :categories, through: :categorisations

  default_scope -> { order(name: :asc) }

  def self.search_for(keyword)
    # square brackets optional
    where(["name LIKE ?", "%#{keyword}%"])
  end
end
