class OwnershipsController < ApplicationController
  def draft
    @orders = Order.search(params[:round], params[:team])
  end

  def pick
    @ownerships = Ownership.latest(3)
    @order = Order.next
  end
end
