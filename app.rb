require('pry')
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/products_controller')
require_relative('controllers/manufacturers_controller')

get '/' do
  erb( :index )
end

post '/new' do
  if params['type'] == 'product'
    redirect to ('/products/new')
  elsif params['type'] == 'manufacturer'
    redirect to ('/manufacturers/new')
  end
end
