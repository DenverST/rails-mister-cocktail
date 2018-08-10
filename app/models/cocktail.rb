class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true
  validates :catch_phrase, presence: true
  validates :price, presence: true
end
