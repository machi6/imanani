module TasksHelper
  def tasks(tasks, issue, product)
    html = ''
    task_count = 0
    tasks.where(issue_id: issue.id).each do |task|
      html += render(partial: 'tasks/task', locals: {product: product, issue: issue, task: task, task_count: task_count})
      task_count += 1
    end
    raw(html)
  end
end
