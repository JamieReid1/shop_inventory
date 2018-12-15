
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
    sql = "INSERT INTO stock_items ( product_id,
                                     manufacturer_id,
                                     quantity
                                   ) VALUES ( $1, $2, $3 )
           RETURNING id"
    values = [@product_id, @manufacturer_id, @quantity]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM stock_items"
    stock_items = SqlRunner.run(sql)
    return stock_items.map{ |stock_item| Stock.new(stock_item) }
  end

  def self.find(id)
    sql = "SELECT * FROM stock_items WHERE id = $1"
    values = [id]
    stock_item = SqlRunner.run(sql, values)
    return Stock.new(stock_item.first)
  end

  def update()
    sql = "UPDATE stock_items SET ( product_id,
                                    manufacturer_id,
                                    quantity
                                  ) = ( $1, $2, $3 )
                                  WHERE id = $4"
    values = [@product_id, @manufacturer_id, @quantity, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM stock_items"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM stock_items WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def product()
    sql = "SELECT products.* FROM
           products INNER JOIN stock_items
           ON products.id = stock_items.product_id WHERE stock_items.id = $1 "
    values = [@id]
    product = SqlRunner.run(sql, values)
    return Product.new(product.first)
  end

  def manufacturer()
    sql = "SELECT manufacturers.* FROM
           manufacturers INNER JOIN stock_items
           ON manufacturers.id = stock_items.manufacturer_id WHERE stock_items.id = $1 "
    values = [@id]
    manufacturer = SqlRunner.run(sql, values)
    return Manufacturer.new(manufacturer.first)
  end


end
