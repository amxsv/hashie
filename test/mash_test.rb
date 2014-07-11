require 'test_helper'

# Tests
class HashieMashTest < MiniTest::Unit::TestCase
  def setup
    @mash = Hashie::Mash.new
  end

  def test_check_if_not_exist
    assert false, @mash.name?
  end

  def test_nil_if_not_exist
    assert_equal nil, @mash.name
  end

  def test_add_value
    @mash.name = 'Test string'
    assert_equal 'Test string', @mash.name
  end

  def test_check_if_exist
    @mash.name = 'Test string'
    assert_equal true, @mash.name?
  end
end
