class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  before_action :move_to_index, only: [:index, :create]
  def index
    @order = OrderForm.new
  end

  def create
    @order = OrderForm.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(
      :post_code,
      :prefecture_id,
      :municipality,
      :street_number,
      :building,
      :phone_number,
      :user_id,
      :item_id
    ).merge(token: params[:token],
            user_id: current_user.id,
            item_id: params[:item_id])
  end

  def set_order
    @item = Item.find(params[:item_id])
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    return unless current_user.id == @item.user_id || @item.order.present?

    redirect_to root_path
  end
end
