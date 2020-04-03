class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :categories

  validate :has_one_or_more_categories

  has_one_attached :image

  def has_one_or_more_categories
    errors.add(:cateories, "- need at least one category") if categories.empty?
  end
end
