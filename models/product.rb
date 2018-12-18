
require_relative('../db/sql_runner.rb')


class Product

  attr_reader :id
  attr_accessor :name, :category, :description, :buy_cost, :sell_cost, :quantity, :manufacturer_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @category = options['category']
    @description = options['description']
    @buy_cost = options['buy_cost'].to_i
    @sell_cost = options['sell_cost'].to_i
    @quantity = options['quantity'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i if options['manufacturer_id']
  end


  def save()
    sql = "INSERT INTO products ( name,
                                  category,
                                  description,
                                  buy_cost,
                                  sell_cost,
                                  quantity,
                                  manufacturer_id
                                ) VALUES ( $1, $2, $3, $4, $5, $6, $7 )
           RETURNING id"
    values = [@name, @category, @description, @buy_cost, @sell_cost, @quantity, @manufacturer_id]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM products"
    products = SqlRunner.run(sql)
    return products.map{ |product| Product.new(product) }
  end

  def self.find(id)
    sql = "SELECT * FROM products WHERE id = $1"
    values = [id]
    product = SqlRunner.run(sql, values)
    return Product.new(product.first)
  end

  def self.all_by_category(category)
    sql = "SELECT * FROM products WHERE category = $1"
    values = [category]
    products = SqlRunner.run(sql, values)
    return products.map{ |product| Product.new(product) }
  end

  def update()
    sql = "UPDATE products SET ( name,
                                 category,
                                 description,
                                 buy_cost,
                                 sell_cost,
                                 quantity
                                ) = ( $1, $2, $3, $4, $5, $6 )
                                WHERE id = $7"
    values = [@name, @category, @description, @buy_cost, @sell_cost, @quantity, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM products"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM products WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def manufacturer()
    sql = "SELECT manufacturers.* FROM
           manufacturers INNER JOIN products
           ON manufacturers.id = products.manufacturer_id WHERE products.id = $1"
    values = [@id]
    manufacturers = SqlRunner.run(sql, values)
    return manufacturers.map { |manufacturer| Manufacturer.new(manufacturer) }
  end


end
