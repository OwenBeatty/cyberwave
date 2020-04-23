class OrdersController < InheritedResources::Base
  before_action :initialize_session
  before_action :load_cart
  before_action :load_order_total
  before_action :load_order_notes

  private

  def order_params
    params.require(:order).permit(:user_id, :status, :address, :total, :note)
  end

  def initialize_session
    session[:cart] ||= []
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end

  def load_order_total
    total = 0
    Product.find(session[:cart]).each do |product|
      total += product.price
    end
    @total = total
    @taxes = (current_user.province.pst + current_user.province.gst + current_user.province.hst) * total
  end

  def load_order_notes
    notes = ""
    Product.find(session[:cart]).each do |product|
      notes = notes + " " + product.name + " - $" + product.price.to_s + ", "
    end
    @note = notes
  end
end
