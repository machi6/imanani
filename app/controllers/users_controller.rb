class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    # todays_date = Date.today
    base_time = Time.now
    if params[:date] != nil && params[:date] != ""
      d = params[:date].split('-')
      base_time = Time.local(d[0].to_i, d[1].to_i, d[2].to_i, Time.now.hour, Time.now.day, Time.now.sec)
    end
    week_start = (base_time - Date.today.wday * 86400 - Time.now.hour*3600 - Time.now.min*60  - Time.now.sec)
    week_end = week_start + 604800; #604800...1週間分の秒数
    @products = Product.where(user_id: params[:id]).includes(:issues)
    @tasks = Task.includes(issue: :product).where(products: { user_id: params[:id]}).where(start: week_start..week_end).order(start: "ASC")
  end
end
