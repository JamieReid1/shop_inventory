
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
