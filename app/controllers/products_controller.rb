class ProductsController < ApplicationController
  def new
    @product = Product.new
    @user = User.find(params[:user_id])
  end
  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      redirect_to user_path(params[:user_id])
    else
      @product = Product.new
      @user = User.find(params[:user_id])
      render :new
    end
  end
  def edit
    @product = Product.find(params[:id])
    @user = User.find(params[:user_id])
  end
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to user_path(params[:user_id])
    else
      @product = Product.find(params[:id])
      @user = User.find(params[:user_id])
      render :edit
    end
  end
  def destroy
    product = Product.find(params[:id])
    if product.destroy
      redirect_to user_path(params[:user_id])
    else
      @product = Product.find(params[:id])
      @user = User.find(params[:user_id])
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:name).merge(user_id: current_user.id)
  end
end
