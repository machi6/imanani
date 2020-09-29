class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    todays_date = Date.today
    week_start = (Time.now - todays_date.wday * 86400 - Time.now.hour*3600 - Time.now.min*60  - Time.now.sec)
    week_end = week_start + 604800; #604800...1週間分の秒数
    @products = Product.where(user_id: params[:id]).includes(:issues)
    @tasks = Task.includes(issue: :product).where(products: { user_id: params[:id]}).where(start: week_start..week_end).order(start: "ASC")
  end
end
