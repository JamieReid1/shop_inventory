
def self.product_id(id)
    sql = "SELECT products.* FROM
           products INNER JOIN stock_items
           ON products.id = stock_items.product_id WHERE product_id = $1"
    values = [id]
    product = SqlRunner.run(sql, values)
    return Product.new(product.first)
  end

  def self.manufacturer_id(id)
    sql = "SELECT manufacturers.* FROM
           manufacturers INNER JOIN stock_items
           ON manufacturers.id = stock_items.manufacturer_id WHERE manufacturer_id = $1"
    values = [id]
    manufacturer = SqlRunner.run(sql, values)
    return Manufacturer.new(manufacturer.first)
  end

  def self.products()
    sql = "SELECT * FROM products"
    products = SqlRunner.run(sql)
    return products.map { |product| Product.new(product) }
  end

def self.manufacturers()
    sql = "SELECT * FROM manufacturers"
    manufacturers = SqlRunner.run(sql)
    return manufacturers.map { |manufacturer| Manufacturer.new(manufacturer) }
  end

  def self.find_item(id)
    sql = "SELECT products.* FROM
           products INNER JOIN stock_items
           ON products.id = stock_items.product_id INNER JOIN manufacturers
           ON manufacturers.id = stock_items.manufacturer_id WHERE stock_items.id = $1"
    values = [id]
    products = SqlRunner.run(sql, values).
    return products.map { |product| Products.new(product) }
  end
