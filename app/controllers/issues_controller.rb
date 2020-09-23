class IssuesController < ApplicationController
  def index
    @products = Product.where(user_id: current_user.id)
  end
  def new
    @issue = Issue.new
    @product = Product.find(params[:product_id])
  end
end
