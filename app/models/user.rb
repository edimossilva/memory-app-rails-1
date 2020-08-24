class User < ApplicationRecord
    validates :name, :phone, presence: true
    validates :name, :phone, format: { with: /\A[a-zA-Z]+\z/}
end
