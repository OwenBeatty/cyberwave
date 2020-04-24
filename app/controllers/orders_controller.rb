class OrdersController < InheritedResources::Base
  before_action :initialize_session
  before_action :load_cart
  before_action :load_order_total
  before_action :load_order_taxes
  before_action :load_order_notes

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "" }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :status, :address, :total, :note, :name)
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
  end

  def load_order_taxes
    @taxes = (current_user.province.pst + current_user.province.gst + current_user.province.hst) * @total
  end

  def load_order_notes
    notes = ""
    Product.find(session[:cart]).each do |product|
      notes = notes + " " + product.name + " - $" + product.price.to_s + ", "
    end
    @note = notes
  end
end
