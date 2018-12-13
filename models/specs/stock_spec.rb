
require('minitest/autorun')
require('minitest/rg')
require_relative('../stock')


class TestStock < MiniTest::Test

  def setup()

    options = { 'id' => 1,
                'product_id' => 1,
                'manufacturer_id' => 1,
                'quantity' => 1
              }

    @stock_item = Stock.new(options)

  end

  def test_stock_id__product()
    assert_equal(1, @stock_item.product_id)
  end

  def test_stock_id__manufacturer()
    assert_equal(1, @stock_item.manufacturer_id)
  end

  def test_stock_quantity()
    assert_equal(1, @stock_item.quantity)
  end


end
