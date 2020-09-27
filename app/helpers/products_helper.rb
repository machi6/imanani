module ProductsHelper
  def products(products, user_)
    html = ''
    products.each do |product|
      html += render(partial: 'products/product', locals: {product: product, user_: user_})
    end
    raw(html)
  end
end
