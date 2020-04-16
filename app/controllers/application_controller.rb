class ApplicationController < ActionController::Base
  before_action :set_categories
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_categories
    @categories_nav = Category.all
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password name address province province_id])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[email password name address province province_id])
  end
end
