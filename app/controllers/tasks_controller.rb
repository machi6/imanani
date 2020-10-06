class TasksController < ApplicationController
  #before_action :get_info , only: [:create, :edit, :update, :destory]

  def new
    @task = Task.new
    @user = User.find(params[:user_id])
  end
  def create
    @task = Task.new(task_params)
    @issue = Issue.new
    @product = Product.find(params[:product_id])
    @user = User.find(params[:user_id])
    if @task.valid?
      @task.save
      shift_task([@task.id])
      cut_time(@task.id)
      redirect_to user_path(params[:user_id])
    else
      @task = Task.new(task_params)
      @issue = Issue.new
      @product = Product.find(params[:product_id])
      @user = User.find(params[:user_id])
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    @product = Product.find(params[:product_id])
    @issue = Issue.find(params[:issue_id])
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      shift_task([@task.id])
      cut_time(@task.id)
      redirect_to user_path(params[:user_id])
    else
      @product = Product.find(params[:product_id])
      @issue = Issue.find(params[:issue_id])
      @task = Task.find(params[:id])
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @issue = Issue.find(params[:issue_id])
    @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to user_path(params[:user_id])
    else
      @product = Product.find(params[:product_id])
      @issue = Issue.find(params[:issue_id])
      @user = User.find(params[:user_id])
      @task = Task.find(params[:id])
      render :edit
    end
  end

  private
  def get_info
    @user = User.find(params[:user_id])
    @issue = Issue.find(params[:issue_id])
    @product = Product.find(params[:product_id])
  end

  def task_params
    params.require(:task).permit(:title, :start, :time, :content).merge(issue_id: params[:issue_id])
  end

  def shift_task(ids)
    #開始時間が重複したタスクは時間をシフトする
    wrapped_task_ids = get_ids_in_time_range(ids)
    if wrapped_task_ids.length > 0
      difference = get_latest_end_time(ids) - get_fastest_start_time(wrapped_task_ids)
      wrapped_task_ids.each do |id|
        task = Task.find(id)
        task.update(start: task.start + difference)
        #移動した先で開始時間が重複したタスクはそれも時間をシフトする
        shift_task(wrapped_task_ids)
      end
    end
  end

  def cut_time(id)
    #タスクの終了時間が重複したものは時間をカットする
    deployed_task_start = Task.find(id).start
    get_own_tasks.each do |task|
      if task.start < deployed_task_start && deployed_task_start < get_end_time(task)
        difference = get_end_time(task) - deployed_task_start
        task.update(time: task.time - difference)
      end
    end
  end

  def get_ids_in_time_range(ids)
    fastest = get_fastest_start_time(ids)
    latest = get_latest_end_time(ids)
    ids_in_range = Array.new
    get_own_tasks.each do |task|
      if fastest <= task.start && task.start < latest
        ids_in_range << task.id
      end
    end
    #自分は除く
    ids.each do |id|
      ids_in_range.delete(id)
    end
    return ids_in_range
  end

  def get_end_time(task)
    task.start + task.time.hour * 3600 + task.time.min * 60 + task.time.sec
  end

  def get_fastest_start_time(ids)
    fastest = Task.find(ids[0]).start
    ids.each do |id|
      task = Task.find(id)
      fastest = task.start if task.start <= fastest
    end
    return fastest
  end

  def get_latest_end_time(ids)
    latest = Task.find(ids[0]).start
    ids.each do |id|
      task = Task.find(id)
      latest = get_end_time(task) if latest <= get_end_time(task)
    end
    return latest
  end

  def get_own_tasks
    #担当部品のidを全て取得
    all_products_id = Array.new
    all_products_id << Product.where(user_id: current_user.id).ids
    
    #担当部品が抱える課題のidを全て取得
    all_issues_id = Array.new
    all_products_id.each do |product_id|
      all_issues_id.concat(Issue.where(product_id: product_id).ids)
    end
    #全ての課題のidを取得
    all_tasks_id = Array.new
    all_issues_id.each do |issue_id|
      all_tasks_id.concat(Task.where(issue_id: issue_id).ids)
    end
    #自分の全てのタスクを取得
    ordered_tasks = Task.where(id: all_tasks_id).order(start: "ASC")
  end

end
