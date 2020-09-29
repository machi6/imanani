module ProductsHelper
  def products(products)
    html = ''
    product_id = 0
    issue_id = 0
    products.each do |product|
      html += render(partial: 'products/product', locals: {product: product, product_id: product_id})
      product.issues.each do |issue|
        html += render(partial: 'issues/issue', locals: {issue: issue, product: product , product_id: product_id, issue_id: issue_id})
        issue_id += 1
      end
      product_id += 1
    end
    raw(html)
  end
end
