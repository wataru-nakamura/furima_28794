class BuyersController < ApplicationController
  before_action :move_to_login
  before_action :product_find

  def index
    @buyer = Buyerorder.new
  end

  def create
    @buyer = Buyerorder.new(buyer_params)
    # binding.pry
    if @buyer.valid?
      pay_item
      binding.pry
      @buyer.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def product_find
    @product = Product.find(params[:product_id])
  end

  def buyer_params
    params.require(:buyerorder).permit(:token, :postal_code, :prefectures_id, :city,
    :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: @product.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.selling_price,
      card: params[:token],
      currency:'jpy'
    )
  end

end
