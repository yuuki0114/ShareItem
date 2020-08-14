class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @items = Item.order(id: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品を出品しました"
      redirect_to root_path
    else
      flash[:alert] = "商品を出品できませんでした"
      redirect_to new_item_path
    end 
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      flash[:notice] = "商品を削除しました"
      redirect_to root_path
    else
      flash[:alert] = "商品を削除できませんでした"
      redirect_to item_path(@item.id)
    end 
  end

  def pay
    @card = CreditCard.find_by(user_id: current_user.id)
    @item = Item.find(params[:id])
    Payjp.api_key = Rails.application.credentials[:PAYJP_SECRET_KEY]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    if Payjp::Charge.create(amount: @item.price, customer: customer, currency: 'jpy' )
      @item.update!(trading_status: "貸し出し済")
      flash[:notice] = "商品をレンタルしました。"
      redirect_to new_item_path
    else
      render action: :buy
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :detail, :image, :rental_start, :rental_end, :postcode, :address_region, :price, :trading_status).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
