
class Stock

  attr_reader :product_id, :manufacturer_id, :quantity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @product_id = options['product_id'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
    @quantity = options['quantity'].to_i
  end


end
