
class Manufacturer

  attr_reader :name, :address, :rep_name, :tel_no 

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @tel_no = options['tel_no']
    @rep_name = options['rep_name']
  end


end
