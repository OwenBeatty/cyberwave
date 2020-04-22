class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:user_id, :status, :address, :total, :note)
    end

end
