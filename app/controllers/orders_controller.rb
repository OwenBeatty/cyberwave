class OrdersController < InheritedResources::Base
  before_action :initialize_session
  before_action :load_cart

  private

  def order_params
    params.require(:order).permit(:user_id, :status, :address, :total, :note)
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end
end
