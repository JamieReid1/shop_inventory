
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/product.rb' )
require_relative( '../models/stock.rb' )
also_reload( '../models/*' )

get '/products' do
  @stocks = Stock.all()
  erb( :'products/index' )
end

get '/products/:id' do
  @stock = Stock.find(params['id'])
  erb( :'products/update' )
end

post '/products/:id' do
  stock = Stock.new(params).update
  product = Product.new(stock)
  binding.pry
  redirect to ('/products')
end
