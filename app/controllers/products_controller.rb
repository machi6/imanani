class ProductsController < ApplicationController
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      redirect_to issues_path
    else
      redirect_to new_product_path
    end
  end
  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to issues_path
    else
      @product = Product.find(params[:id])
      render :edit
    end
  end
  def destroy
    product = Product.find(params[:id])
    if product.destroy
      redirect_to issues_path
    else
      @product = Product.find(params[:id])
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:name).merge(user_id: current_user.id)
  end
end
