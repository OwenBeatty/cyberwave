class Order < ApplicationRecord
  belongs_to :user

  validates :user_id, :status, :address, :total, :note, :name, presence: true
  validates :user_id, numericality: { only_integer: true }
  validates :total, numericality: true
end
