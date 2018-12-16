
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
  @product = @stock.product
  erb( :'products/update' )
end
# params = manufacturer id, how do i get stock quantity from manufacturer id
get '/products/show/:id' do
  @manufacturer = Manufacturer.find(params['id'])
  @products = @manufacturer.products
  erb(:'products/show')
end

post '/products/:id' do
  stock = Stock.new(params)
  @stock = Stock.find(params['id'])
  @stock.quantity = params['quantity']
  @stock.update()
  product = stock.product
  product.name = params['name']
  product.category = params['category']
  product.description = params['description']
  product.buy_cost = params['buy_cost']
  product.sell_cost = params['sell_cost']
  product.update()
  redirect to ('/products')
end
