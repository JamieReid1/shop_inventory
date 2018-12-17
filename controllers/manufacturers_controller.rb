
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/manufacturer.rb' )
require_relative( '../models/stock.rb' )
also_reload( '../models/*' )

get '/manufacturers' do
  @stocks = Stock.all()
  @stock = @stocks.uniq { |i| i.manufacturer_id }
  erb( :'manufacturers/index' )
end

get '/manufacturer/:id' do
  # @stock = Stock.find(params['id'])
  @manufacturer = Manufacturer.find(params['id'])
  erb( :'manufacturers/update' )
end

post '/manufacturer/:id' do
  Manufacturer.new(params).update()
  # stock = Stock.new(params)
  # manufacturer = stock.manufacturer
  # manufacturer.name = params['name']
  # manufacturer.address = params['address']
  # manufacturer.tel_no = params['tel_no']
  # manufacturer.rep_name = params['rep_name']
  # manufacturer.update()
  redirect to ('/manufacturers')
end
