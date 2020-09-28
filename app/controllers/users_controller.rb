class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    #@products = Product.where(user_id: params[:id])
    #@issues = Issue.all
    todays_date = Date.today
    week_start = (Time.now - todays_date.wday * 86400 - Time.now.hour*3600 - Time.now.min*60  - Time.now.sec)
    week_end = week_start + 604800; #604800...1週間分の秒数
    #@tasks = Task.where(start: week_start..week_end).order(start: "ASC")
    @products = Product.where(user_id: params[:id]).includes(:issues)
    @tasks = Task.includes(issue: :product).where(products: { user_id: params[:id]}).order(start: "ASC")
    #@products_main.where(issues: {summary: "BEAM CP Fの課題１"})
    
  end
end
