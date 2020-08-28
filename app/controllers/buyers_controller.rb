class BuyersController < ApplicationController
  before_action :move_to_login
  before_action :product_find

  def index
    @buyer = Buyerorder.new

    # 出品者が直接購入ページに遷移してくるとトップページに遷移する
    return redirect_to root_path if current_user.id == @product.user_id

    # 購入済みの商品の購入ページに直接遷移してくるとトップページに飛ぶ
    return redirect_to root_path if @product.order
  end

  def create
    @buyer = Buyerorder.new(buyer_params)
    if @buyer.valid?
      pay_item
      @buyer.save
      redirect_to root_path
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
    params.require(:buyerorder).permit(:postal_code, :prefectures_id, :city,
                                       :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, product_id: @product.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.selling_price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
