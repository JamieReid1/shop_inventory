
require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../product')


class TestProduct < MiniTest::Test


  def setup()

    options = { 'id' => 1,
                'name' => 'Superlite 17B',
                'category' => 'helmets',
                'description' => 'Carbon fibre shell with yoke and clamp neck dam.',
                'buy_cost' => 3000,
                'sell_cost' => 5000
              }

    @product = Product.new(options)

  end


  def test_product_name()
    assert_equal('Superlite 17B', @product.name)
  end


end
