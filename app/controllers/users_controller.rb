class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:guest]
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    # todays_date = Date.today
    base_time = Time.current
    week_start = (base_time - Date.today.wday * 86400 - Time.current.hour*3600 - Time.current.min*60  - Time.current.sec)
    if params[:date] != nil && params[:date] != ""
      d = params[:date].split('-')
      base_time = Time.local(d[0].to_i, d[1].to_i, d[2].to_i, 0, 0, 0)
      week_start = (base_time - base_time.wday * 86400)
    end
    week_end = week_start + 604800; #604800...1週間分の秒数
    @week_start_day = Date.new(week_start.year, week_start.mon, week_start.day)
    @products = Product.where(user_id: params[:id]).includes(:issues)
    @tasks = Task.includes(issue: :product).where(products: { user_id: params[:id]}).where(start: week_start..week_end).order(start: "ASC")
  end
  def guest
    user = User.find(1)
    sign_in user
    redirect_to root_path
  end
end
