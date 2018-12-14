
require('minitest/autorun')
require('minitest/rg')
require_relative('../product')


class TestProduct < MiniTest::Test


  def setup()

    options = { 'id' => 1,
                'name' => 'Superlite 17B',
                'category' => 'helmets',
                'description' => 'Carbon fibre shell, SuperFlow regulator, neck dam clamp with hinged yoke.',
                'buy_cost' => 4000,
                'sell_cost' => 5600
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
    assert_equal('Carbon fibre shell, SuperFlow regulator, neck dam clamp with hinged yoke.', @product.description)
  end

  def test_product_cost__buy()
    assert_equal(4000, @product.buy_cost)
  end

  def test_product_cost__sell()
    assert_equal(5600, @product.sell_cost)
  end


end
