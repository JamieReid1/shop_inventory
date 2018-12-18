
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/manufacturer.rb' )
also_reload( '../models/*' )

get '/manufacturers' do
  @manufacturers = Manufacturer.all()
  erb( :'manufacturers/index' )
end

get '/manufacturers/new' do
  erb(:'manufacturers/new')
end

post '/manufacturers/new' do
  Manufacturer.new(params).save()
  redirect to ('/manufacturers')
end

get '/manufacturer/:id' do
  @manufacturer = Manufacturer.find(params['id'])
  erb( :'manufacturers/update' )
end

post '/manufacturer/:id/update' do
  Manufacturer.new(params).update()
  redirect to ('/manufacturers')
end

post '/manufacturer/:id/delete' do
  Manufacturer.delete(params['id'])
  redirect to ('/manufacturers')
end
