class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @tweet = Item.new
  end

  def create
    render "index"
  end
end
