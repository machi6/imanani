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
end
