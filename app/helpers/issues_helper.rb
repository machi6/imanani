module IssuesHelper
  def issues(issues, product)
    html = ''
    issue_count = 0
    issues.where(product_id: product.id).each do |issue|
      html += render(partial: 'issue', locals: {product: product, issue: issue, issue_count: issue_count})
      issue_count += 1
    end
    raw(html)
  end

  def schedule_lines
    html = ''
    hour_ = 0
    wday_ = ["日", "月", "火", "水", "木", "金", "土"]
    wday_num = 0
    168.times do |i|
      if i % 24 == 0
        hour_ = 0
        html += render(partial: 'date_disp', locals: {wday_: wday_, wday_num: wday_num})
        wday_num += 1
      end
      html += render(partial: 'time_disp', locals: {hour_: hour_, i: i})
      html += render(partial: 'vertical_line', locals: {i: i})
      hour_ += 1
    end
    raw(html)
  end
end
