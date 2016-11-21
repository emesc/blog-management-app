class Category < ApplicationRecord
  has_many :categorisations
  has_many :products, through: :categorisations
end
