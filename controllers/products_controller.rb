
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/product.rb' )
also_reload( '../models/*' )

get '/products' do
  @products = Product.all()
  erb( :'products/index' )
end

get '/products/:id' do
  @product = Product.find(params['id'])
  erb( :'products/update' )
end

get '/products/show/:id' do
  @manufacturer = Manufacturer.find(params['id'])
  @products = @manufacturer.products
  erb(:'products/show')
end

post '/products/:id/update' do
  Product.new(params).update()
  redirect to ('/products')
end
