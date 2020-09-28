module TasksHelper
  def tasks(tasks)
    html = ''
    tasks.each do |task|
      html += render(partial: 'tasks/task2', locals: {task: task})
    end
    raw(html)
  end
end
