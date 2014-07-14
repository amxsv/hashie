require 'test_helper'

# Tests
class HashieMashTest < MiniTest::Unit::TestCase
  def setup
    @mash = Hashie::Mash.new
  end

  def test_check_if_not_exist
    assert !@mash.name?
  end

  def test_nil_if_not_exist
    assert_equal nil, @mash.name
  end

  def test_add_value
    @mash.name = 'Test'
    assert_equal 'Test', @mash.name
  end

  def test_check_if_exist
    @mash.name = 'Test string'
    assert_equal true, @mash.name?
  end

  def test_nesting_mash
    @mash.author!.name = 'Michael Bleigh'
    assert_equal Hashie::Mash, @mash.author.class
  end

  def test_multi_level_testing
    assert_equal false, @mash.author_.name?
  end
end
