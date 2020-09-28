module TasksHelper
  def tasks(tasks, issue, product, user_)
    html = ''
    task_count = 0
    tasks.where(issue_id: issue.id).each do |task|
      html += render(partial: 'tasks/task', locals: {product: product, issue: issue, task: task, task_count: task_count, user_: user_})
      task_count += 1
    end
    raw(html)
  end

  def tasks_(tasks)
    html = ''
    tasks.each do |task|
      html += render(partial: 'tasks/task2', locals: {task: task})
    end
    raw(html)
  end
end
