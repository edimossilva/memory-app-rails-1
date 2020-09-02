class User < ApplicationRecord
  validates :name, :phone, presence: true
  validates :name, format: { with: /\A[a-zA-Z]+\z/ }
  validates :phone, numericality: { only_integer: true }
  scope :search_by_name, ->(query) { where('name ilike ?', "#{query}%") }
end
