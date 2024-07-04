class OrdersController < ApplicationController
  
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :redirect_if_sold_out, only: [:index, :create]

  def index
    gon.payjp_public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_address = PurchaseAddress.new
  end

  def create
    puts "Received params: #{params.inspect}"
    puts "Permitted params: #{purchase_params.inspect}"
    @purchase_address = PurchaseAddress.new(purchase_params)
    puts "Parameters: #{purchase_params.inspect}" # デバッグ用の出力

    if @purchase_address.valid?
      begin
        puts "Payment process starting..." # デバッグ用の出力
        pay_item
        @purchase_address.save
        puts "Purchase saved successfully" # デバッグ用の出力
        redirect_to root_path, notice: '購入が完了しました'
      rescue => e
        puts "Payment failed: #{e.message}" # デバッグ用の出力
        flash.now[:alert] = '決済処理に失敗しました。もう一度お試しください。'
        render :index
      end
    else
      gon.payjp_public_key = ENV["PAYJP_PUBLIC_KEY"]
      puts "Validation failed: #{@purchase_address.errors.full_messages}" # デバッグ用の出力
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
    puts "Payment successful: #{charge.id}" # デバッグ用の出力
  rescue => e
    puts "Payment failed: #{e.message}" # デバッグ用の出力
    raise e
  end
end
