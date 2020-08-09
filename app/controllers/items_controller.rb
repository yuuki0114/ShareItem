class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  
  def index
    @items = Item.order(id: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if 
      @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end 
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :detail, :image, :rental_period, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
