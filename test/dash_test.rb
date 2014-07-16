require 'test_helper.rb'

class Person < Hashie::Dash
  property :name, required: true
  property :email
  property :occupation, default: 'Rubyist'
end

class HashieDashTest < MiniTest::Test
  def setup
    @person = Person.new(name: 'Bob')
  end

  def test_creating_object
    assert_equal 'Bob', @person.name
  end

  def test_get_by_batteries
    assert_equal 'Bob', @person[:name]
  end

  def test_set_by_batteries
    @person[:name] = 'Kim'
    assert_equal 'Kim', @person[:name]
  end

  def test_change_attribute
    @person.name = 'Kim'
    assert_equal 'Kim', @person.name
  end

  def test_no_method_error
    assert_raises(NoMethodError) { @person.asd }
  end

  def test_required_property
    assert_raises(ArgumentError) { @not_person = Person.new(name: nil) }
  end

  def test_default_property
    assert_equal 'Rubyist', @person.occupation
  end

  def test_update_attributes
    @person.update_attributes!(name: 'Trudy')
    assert_equal 'Trudy', @person.name
  end

  def test_update_attributes_by_default
    @person.update_attributes!(occupation: nil)
    assert_equal 'Rubyist', @person.occupation
  end
end
