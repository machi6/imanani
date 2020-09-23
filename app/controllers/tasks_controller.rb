class TasksController < ApplicationController
  def new
    @task = Task.new
  end
  def create
    
    @task = Task.new(task_params)
    if @task.valid?
      #以下の処理、テーブルの結合でうまくできないのか？
      #担当部品のidを全て取得
      all_products_id = Array.new
      Product.all.each do |product| #userを登録後は、Product.all.where(current_user.id)とでもすればいいと思う
        all_products_id << product.id
      end
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
      
      #新しいタスクが割り込みだったらそれ以降のタスクをシフトする
      new_task_end = @task.start + @task.time.min * 60 + @task.time.hour * 3600
      new_task_man_hours = @task.time.min * 60 + @task.time.hour * 3600
      
      difference = 0.0
      changed = false

      ordered_tasks.each do |task|
        if changed == false
          if @task.start < task.start && task.start < new_task_end
            difference = new_task_end - task.start
            task.update(start: task.start + difference)
            changed = true
            next
          end
        else
          task.update(start: task.start + difference)
        end
      end
      
      @task.save
      redirect_to issues_path
    else
      render :new
    end
    
  end

  private
  def task_params
    params.require(:task).permit(:title, :start, :time).merge(issue_id: params[:issue_id])
  end
end
