module ProductsHelper
  def products(products)
    html = ''
    products.each do |product|
      html += render(partial: 'products/product', locals: {product: product})
    end
    raw(html)
  end
end
