class CreditCardsController < ApplicationController
  
  require "payjp"

  def new
    @card = CreditCard.find_by(user_id: current_user.id)
    if @card.present?
      redirect_to credit_card_path(current_user.id)
    else
      card = CreditCard.where(user_id: current_user.id)
    end
  end

  def create
    Payjp.api_key = Rails.application.credentials[:PAYJP_SECRET_KEY]
    if params['payjp-token'].blank?
      redirect_to action: :new
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id},
        description: 'test'
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        flash[:notice] = "支払い方法を登録しました"
        redirect_to user_path(current_user.id)
      else
        flash[:alert] = "支払い方法を登録できませんでした。"
        redirect_to action: :new
      end
    end
  end

  def destroy
    creditCard = CreditCard.find(params[:id])
    if creditCard.destroy
      flash[:notice] = "支払い方法を削除しました。"
    else
      flash[:alert] = "支払い方法を削除できませんでした。"
    end
    redirect_to user_path(current_user.id)
  end
end
