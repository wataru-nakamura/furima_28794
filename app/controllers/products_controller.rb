class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :find_product, only: [:show, :edit, :destroy]

  def index
    @products = Product.all.order('created_at DESC')
  end

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

  def show
  end

  def edit
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to root_path if product.save
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :image, :name, :explanation, :category_id,
      :status_id, :shipping_fee_id, :shipping_origin_id,
      :shipping_price_id, :selling_price, :user_id
    ).merge(user_id: current_user.id)
  end
end
