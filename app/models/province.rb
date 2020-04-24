class Province < ApplicationRecord
  has_many :users, dependent: :restrict_with_exception

  validates :name, :pst, :gst, :hst, presence: true
  validates :pst, :gst, :hst, numericality: true
end
