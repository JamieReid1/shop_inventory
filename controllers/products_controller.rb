
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/product.rb' )
also_reload( '../models/*' )

get '/products' do
  @products = Product.all()
  @manufacturers = Manufacturer.all()
  erb( :'products/index' )
end

get '/products/new' do
  @manufacturers = Manufacturer.all()
  @products = Product.all()
  erb(:'products/new')
end

post '/products/new' do
  Product.new(params).save()
  redirect to ('/products')
end

get '/products/:id' do
  @product = Product.find(params['id'])
  erb( :'products/index' )
end

get '/products/show/:id' do
  @manufacturer = Manufacturer.find(params['id'])
  @products = @manufacturer.products
  erb(:'products/index')
end

post '/products/category' do
  @products = Product.all_by_category(params['category'])
  @manufacturers = Manufacturer.all()
  erb(:'products/index')
end

get '/category/new' do
  erb(:'products/category')
end

post '/products/:id/update' do
  Product.new(params).update()
  redirect to ('/products')
end

post '/products/:id/delete' do
  Product.delete(params['id'])
  redirect to ('/products')
end
