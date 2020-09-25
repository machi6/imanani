class IssuesController < ApplicationController
  def index
    @products = Product.where(user_id: current_user.id)
    @issues = Issue.all
    todays_date = Date.today
    week_start = (Time.now - todays_date.wday * 86400 - Time.now.hour*3600 - Time.now.min*60  - Time.now.sec)
    week_end = week_start + 604800; #604800...1週間分の秒数
    @tasks = Task.where(start: week_start..week_end).order(start: "ASC")
    
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
  def edit
    @product = Product.find(params[:product_id])
    @issue = Issue.find(params[:id])
  end
  def update
    @issue = Issue.find(params[:id])
    if @issue.update(issue_params)
      redirect_to issues_path
    else
      @product = Product.find(params[:product_id])
      @issue = Issue.find(params[:id])
      render :edit
    end
  end
  def destroy
    issue = Issue.find(params[:id])
    if issue.destroy
      redirect_to issues_path
    else
      @product = Product.find(params[:product_id])
      @issue = Issue.find(params[:id])
      render :edit
    end
  end

  private
  def issue_params
    params.require(:issue).permit(:summary).merge(product_id: params[:product_id])
  end
end
