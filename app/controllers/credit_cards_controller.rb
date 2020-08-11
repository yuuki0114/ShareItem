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
      redirect_to action: :index
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id},
        description: 'test'
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to root_path
      else
        redirect_to action: :new
      end
    end
  end
end
