require_relative '../test_helper'

class RobotTest < Minitest::Test
  
  def setup
    @data = { :name => "bob",
              :city => "denver",
              :state => "CO",
              :birth_date => "02/02/2001",
              :join_date => "05/21/2014",
              :favorite_color => "green"}
  end
  
  def test_attributes_are_parsed_right
    bob = Robot.new(@data)
    
    assert_equal "bob", bob.name
    assert_equal "denver", bob.city
    assert_equal "CO", bob.state
    assert_equal "02/02/2001", bob.birth_date
    assert_equal "05/21/2014", bob.join_date
    assert_equal "green", bob.favorite_color
  end

  def test_it_knows_sign
    bob = Robot.new(@data)
    
    assert_equal "Aquarius", bob.sign
  end
end
