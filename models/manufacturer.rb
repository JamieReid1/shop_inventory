
require_relative('../db/sql_runner.rb')


class Manufacturer

  attr_reader :id
  attr_accessor :name, :address, :rep_name, :tel_no

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @tel_no = options['tel_no']
    @rep_name = options['rep_name']
  end


  def save()
    sql = "INSERT INTO manufacturers ( name,
                                       address,
                                       tel_no,
                                       rep_name
                                      ) VALUES ( $1, $2, $3, $4 )
           RETURNING id"
    values = [@name, @address, @tel_no, @rep_name]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM manufacturers"
    manufacturers = SqlRunner.run(sql)
    return manufacturers.map{ |manufacturer| Manufacturer.new(manufacturer) }
  end

  def self.find(id)
    sql = "SELECT * FROM manufacturers WHERE id = $1"
    values = [id]
    manufacturer = SqlRunner.run(sql, values)
    return Manufacturer.new(manufacturer.first)
  end

  def update()
    sql = "UPDATE manufacturers SET ( name,
                                 address,
                                 tel_no,
                                 rep_name
                                ) = ( $1, $2, $3, $4 )
                                WHERE id = $5"
    values = [@name, @address, @tel_no, @rep_name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM manufacturers"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM manufacturers WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def products()
    sql = "SELECT products.* FROM
           products INNER JOIN stock_items
           ON products.id = stock_items.product_id WHERE stock_items.manufacturer_id = $1"
    values = [@id]
    products = SqlRunner.run(sql, values)
    return products.map { |product| Product.new(product) }
  end


end
