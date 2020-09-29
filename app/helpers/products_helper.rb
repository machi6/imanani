module ProductsHelper
  def products(products)
    html = ''
    products.each do |product|
      html += render(partial: 'products/product', locals: {product: product})
      product.issues.each do |issue|
        html += render(partial: 'issues/issue', locals: {issue: issue, product: product })
      end
    end
    raw(html)
  end
end
