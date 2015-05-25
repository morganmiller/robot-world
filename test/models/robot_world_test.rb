require_relative '../test_helper'

class RobotWorldTest < Minitest::Test

  def setup
    @data = { :name => "bob",
              :city => "denver",
              :state => "CO",
              :birth_date => "02/02/2001",
              :join_date => "05/21/2014",
              :favorite_color => "green"}

    @data2 = { :name => "carol",
               :city => "nashville",
               :state => "TN",
               :birth_date => "05/06/2001",
               :join_date => "12/01/2013",
               :favorite_color => "yellow"}
  end

  def test_it_creates_a_robot
    RobotWorld.create(@data)
    bot = RobotWorld.all.last
    
    assert_equal "bob", bot.name
    assert_equal "CO", bot.state
  end

  def test_it_shows_all_bots
    3.times do
      RobotWorld.create(@data)
    end
    
    assert_equal 3, RobotWorld.all.length
    
    RobotWorld.create(@data)
    
    assert_equal 4, RobotWorld.all.length
  end

  def test_it_finds_a_bot
    RobotWorld.create(@data)
    RobotWorld.create(@data2)
    
    bot1 = RobotWorld.all[-2]
    bot2 = RobotWorld.all.last
    
    assert_equal "bob", RobotWorld.find(bot1.id).name
    assert_equal "carol", RobotWorld.find(bot2.id).name
  end

  def test_it_updates_a_bot
    RobotWorld.create(@data)
    bot = RobotWorld.all.last
    
    assert_equal "bob", bot.name
    
    RobotWorld.update(bot.id, @data2)
    bot = RobotWorld.all.last
    
    assert_equal "carol", bot.name
  end

  def test_it_deletes_a_bot
    RobotWorld.create(@data)
    bot = RobotWorld.all.last
    
    assert RobotWorld.all.last
    
    RobotWorld.delete(bot.id)
    
    refute RobotWorld.all.last
  end
end
