class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :categories

  validate :has_one_or_more_categories

  has_one_attached :image

  def has_one_or_more_categories
    errors.add(:cateories, "- need at least one category") if categories.empty?
  end

  def self.search(params)
    products = Product.joins(:categories_products).where("products.name LIKE ? AND categories_products.category_id LIKE ?", "%#{params[:search_term]}%", "%#{params[:category]}%")
    products
  end
end
