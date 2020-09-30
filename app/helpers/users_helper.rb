module UsersHelper
  def date_disp_
    html = ''
    hour_ = 0
    wday_ = ["日", "月", "火", "水", "木", "金", "土"]
    wday_num = 0
    168.times do |i|
      if i % 24 == 0
        hour_ = 0
        html += render(partial: 'users/date_disp', locals: {wday_: wday_, wday_num: wday_num})
        wday_num += 1
      end
      html += render(partial: 'users/time_disp', locals: {hour_: hour_, i: i})
      hour_ += 1
    end
    raw(html)
  end

  def time_disp_
  end
  
  def schedule_lines_
    html = ''
    168.times do |i|
      html += render(partial: 'users/vertical_line', locals: {i: i})
    end
    raw(html)
  end
end
