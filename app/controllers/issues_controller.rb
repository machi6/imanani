class IssuesController < ApplicationController
  def index
    @products = Product.where(user_id: current_user.id)
  end
  def new
    @issue = Issue.new
    @product = Product.find(params[:product_id])
  end
  def create
    @issue = Issue.new(issue_params)
    if @issue.valid?
      @issue.save
      redirect_to issues_path
    else
    redirect_to new_product_issue_path(params[:product_id])
    end
  end

  private
  def issue_params
    params.require(:issue).permit(:summary).merge(product_id: params[:product_id])
  end
end
