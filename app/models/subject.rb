class Subject < ApplicationRecord
  has_many :sections

  validates :title,       presence: true
  validates :description, presence: true
end
