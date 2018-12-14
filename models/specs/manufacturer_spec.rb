
require('minitest/autorun')
require('minitest/rg')
require_relative('../manufacturer')


class TestManufacturer < MiniTest::Test


  def setup()

    options = { 'id' => 1,
                'name' => 'Kirby Morgan',
                'address' => '1430 Jason Way, Santa Maria, CA 93455, USA',
                'tel_no' => '(805) 928-7772',
                'rep_name' => 'Dusty Johnson'
               }

    @manufacturer = Manufacturer.new(options)

  end


  def test_manufacturer_name()
    assert_equal('Kirby Morgan', @manufacturer.name)
  end

  def test_manufacturer_address()
    assert_equal('1430 Jason Way, Santa Maria, CA 93455, USA', @manufacturer.address)
  end

  def test_manufacturer_tel_no()
    assert_equal('(805) 928-7772', @manufacturer.tel_no)
  end

  def test_manufacturer_rep_name()
    assert_equal('Dusty Johnson', @manufacturer.rep_name)
  end


end
