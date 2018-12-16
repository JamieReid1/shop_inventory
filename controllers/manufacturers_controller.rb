
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/manufacturer.rb' )
also_reload( '../models/*' )

get '/manufacturers' do
  @manufacturers = Manufacturer.all()
  erb( :'manufacturers/index' )
end

get '/manufacturer/:id' do
  @stock = Stock.find(params['id'])
  erb( :'manufacturers/update' )
end

post '/manufacturer/:id' do
  stock = Stock.new(params)
  manufacturer = stock.manufacturer
  manufacturer.name = params['name']
  manufacturer.address = params['address']
  manufacturer.tel_no = params['tel_no']
  manufacturer.rep_name = params['rep_name']
  manufacturer.update()
  redirect to ('/manufacturers')
end
