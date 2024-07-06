class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: '商品情報が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
      redirect_to root_path
    end

  private

  def set_item
    @item = Item.find_by(id: params[:id])
    redirect_to root_path, alert: 'Item not found' if @item.nil?
  end
end

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_payer_id, :shipping_region_id, :shipping_day_id, :price, :image)
  end

  def correct_user
    return if @item.nil?
    unless current_user == @item.user
      redirect_to items_path, alert: '権限がありません。'
    end
  end