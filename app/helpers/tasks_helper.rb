module TasksHelper
  def tasks(tasks)
    html = ''
    task_id = 0;
    tasks.each do |task|
      html += render(partial: 'tasks/task', locals: {task: task})
      #task.issue.id
      #task.issue.product.id
      task_id += 1;
    end
    raw(html)
  end
end
