class Transaction < ApplicationRecord
  belongs_to :user
  has_many :categories

  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
end
