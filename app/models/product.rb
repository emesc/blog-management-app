class Product < ApplicationRecord
  has_many :categorisations
  has_many :categories, through: :categorisations
end
