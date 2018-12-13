
class Manufacturer

  attr_reader :name, :address, :rep_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @rep_name = options['rep_name']
  end


end
