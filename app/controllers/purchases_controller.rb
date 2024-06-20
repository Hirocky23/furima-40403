class PurchasesController < ApplicationController
  before_action :set_item

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.item = @item
    @purchase.user = current_user

    if @purchase.save
      redirect_to @item, notice: '購入が完了しました。'
    else
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase).permit(:some_purchase_attribute)
  end
end
