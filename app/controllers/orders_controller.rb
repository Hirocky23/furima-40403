class OrdersController < ApplicationController
  
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :redirect_if_sold_out, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)

    if @purchase_address.valid?
      begin
        pay_item
        @purchase_address.save
        redirect_to root_path, notice: '購入が完了しました'
        flash.now[:alert] = '決済処理に失敗しました。もう一度お試しください。'
        render :index
      end
    else
      flash.now[:alert] = '入力内容に誤りがあります。'
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :shipping_region_id, :city, :address_line, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_sold_out
    redirect_to root_path if @item.purchase.present?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
      amount: @item.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end
end
