class ProductsController < ApplicationController
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
      params.require(:product).permit(
        :image, :name, :explanation,:category_id, 
        :status_id,:shipping_fee_id, :shipping_origin_id,
        :shipping_price_id, :selling_price, :user_id
      ).merge(user_id: current_user.id)
  end
end
