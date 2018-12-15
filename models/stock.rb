
require_relative('../db/sql_runner.rb')


class Stock

  attr_reader :id
  attr_accessor :product_id, :manufacturer_id, :quantity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @product_id = options['product_id'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
    @quantity = options['quantity'].to_i
  end


  def save()
    sql = "INSERT INTO stocks ( product_id,
                                manufacturer_id,
                                quantity
                              ) VALUES ( $1, $2, $3 )
           RETURNING id"
    values = [@product_id, @manufacturer_id, @quantity]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM stocks"
    stock_items = SqlRunner.run(sql)
    return stock_items.map{ |stock_item| Stock.new(stock_item) }
  end

  def self.find(id)
    sql = "SELECT * FROM stocks WHERE id = $1"
    values = [id]
    stock_item = SqlRunner.run(sql, values)
    return Stock.new(stock_item.first)
  end

  def update()
    sql = "UPDATE stocks SET ( product_id,
                               manufacturer_id,
                               quantity
                             ) = ( $1, $2, $3 )
                             WHERE id = $4"
    values = [@product_id, @manufacturer_id, @quantity, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM stocks"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM stocks WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def product()
    sql = "SELECT products.* FROM
           products INNER JOIN stocks
           ON products.id = stocks.product_id WHERE stocks.id = $1 "
    values = [@id]
    product = SqlRunner.run(sql, values)
    return Product.new(product.first)
  end

  def manufacturer()
    sql = "SELECT manufacturers.* FROM
           manufacturers INNER JOIN stocks
           ON manufacturers.id = stocks.manufacturer_id WHERE stocks.id = $1 "
    values = [@id]
    manufacturer = SqlRunner.run(sql, values)
    return Manufacturer.new(manufacturer.first)
  end


end
