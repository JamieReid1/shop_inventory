
require('minitest/autorun')
require('minitest/rg')
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

  def test_product_category()
    assert_equal('helmets', @product.category)
  end

  def test_product_description()
    assert_equal('Carbon fibre shell with yoke and clamp neck dam.', @product.description)
  end

  def test_product_cost__buy()
    assert_equal(3000, @product.buy_cost)
  end

  def test_product_cost__sell()
    assert_equal(5000, @product.sell_cost)
  end


end
