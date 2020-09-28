module ProductsHelper
  def products(products, user_)
    html = ''
    products.each do |product|
      html += render(partial: 'products/product', locals: {product: product, user_: user_})
    end
    raw(html)
  end


  def products_(products)
    html = ''
    products.each do |product|
      html += render(partial: 'products/product2', locals: {product: product})
      product.issues.each do |issue|
        html += render(partial: 'issues/issue2', locals: {issue: issue, product: product })
      end
    end
    raw(html)
  end
end
