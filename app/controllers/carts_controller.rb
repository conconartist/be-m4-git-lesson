class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    redirect_to items_path
  end

  def show
    @items = @cart.retreive_items
  end

  def destroy
    @cart.remove_item(params[:item_id])
    redirect_to cart_path
  end
end
