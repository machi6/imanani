module IssuesHelper
  def schedule_lines
    html = ''
    hour_ = 0
    wday_ = ["日", "月", "火", "水", "木", "金", "土"]
    wday_num = 0
    168.times do |i|
      if i % 24 == 0
        hour_ = 0
        html += render(partial: 'issues/date_disp', locals: {wday_: wday_, wday_num: wday_num})
        wday_num += 1
      end
      html += render(partial: 'issues/time_disp', locals: {hour_: hour_, i: i})
      html += render(partial: 'issues/vertical_line', locals: {i: i})
      hour_ += 1
    end
    raw(html)
  end
end
