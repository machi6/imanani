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
      shift_task(@task.id)
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
      shift_task(@task.id)
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

  def shift_task(insert_task_id)
    #この処理、テーブルの結合でうまくできないのか？----------------------------------------------------------
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
    all_tasks_id.delete(insert_task_id)
    #自分の全てのタスクを取得
    ordered_tasks = Task.where(id: all_tasks_id).order(start: "ASC")
    #-------------------------------------------------------------------------------------------------
    #新しいタスクが割り込みだったらそれ以降のタスクをシフトする
    new_task_end = @task.start + @task.time.min * 60 + @task.time.hour * 3600
    # new_task_man_hours = @task.time.min * 60 + @task.time.hour * 3600
    difference = 0.0
    changed = false
    ordered_tasks.each do |task|
      if changed == false
        if @task.start <= task.start && task.start <= new_task_end
          difference = new_task_end - task.start
          task.update(start: task.start + difference)
          changed = true
          next
        end
      else
        task.update(start: task.start + difference)
      end
    end
  end
end
