class Item < ApplicationRecord
  validates :key, :value, presence: true
  validates :key, format: { with: /\A[a-zA-Z]+\z/ }
  validates :value, numericality: { only_integer: true }
  scope :search_by_key, ->(query) { where('key ilike ?', "%#{query}%") }
end
