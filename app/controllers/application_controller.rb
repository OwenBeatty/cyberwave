class ApplicationController < ActionController::Base
  before_action :set_categories

  private

  def set_categories
    @categories_nav = Category.all
  end
end
