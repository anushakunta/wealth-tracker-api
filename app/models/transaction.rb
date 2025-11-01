class Transaction < ApplicationRecord
  belongs_to :user
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :category, presence: true
  validates :transaction_type, inclusion: { in: %w[income expense] }
  validates :date, presence: true
end
