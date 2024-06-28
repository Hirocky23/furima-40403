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
        redirect_to root_path
      rescue => e
        puts "Error during payment or save: #{e.message}"
        @purchase_address.errors.add(:base, "決済処理に失敗しました。もう一度お試しください。")
        render :index
      end
    else
      puts "Validation errors: #{@purchase_address.errors.full_messages}"
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
    redirect_to root_path if @item.order.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
