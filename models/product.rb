
class Product

  attr_reader :name, :category, :description, :buy_cost, :sell_cost

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @category = options['category']
    @description = options['description']
    @buy_cost = options['buy_cost'].to_i
    @sell_cost = options['sell_cost'].to_i
  end


end
