class IssuesController < ApplicationController
  def new
    @issue = Issue.new
    @product = Product.find(params[:product_id])
    @user = User.find(params[:user_id])
  end
  def create
    @issue = Issue.new(issue_params)
    @user = User.find(params[:user_id])
    if @issue.valid?
      @issue.save
      redirect_to user_path(params[:user_id])
    else
      @issue = Issue.new
      @product = Product.find(params[:product_id])
      @user = User.find(params[:user_id])
      render :new
    end
  end
  def edit
    @product = Product.find(params[:product_id])
    @issue = Issue.find(params[:id])
    @user = User.find(params[:user_id])
  end
  def update
    @issue = Issue.find(params[:id])
    @user = User.find(params[:user_id])
    if @issue.update(issue_params)
      redirect_to user_path(params[:user_id])
    else
      @product = Product.find(params[:product_id])
      @issue = Issue.find(params[:id])
      @user = User.find(params[:user_id])
      render :edit
    end
  end
  def destroy
    issue = Issue.find(params[:id])
    @user = User.find(params[:user_id])
    if issue.destroy
      redirect_to user_path(params[:user_id])
    else
      @product = Product.find(params[:product_id])
      @issue = Issue.find(params[:id])
      @user = User.find(params[:user_id])
      render :edit
    end
  end

  private
  def issue_params
    params.require(:issue).permit(:summary).merge(product_id: params[:product_id])
  end
end
