require_relative '../test_helper'

class CreateRobotTest < FeatureTest
  
  def fill(identifier, input)
    fill_in "robot[#{identifier}]", with: input
  end

  def test_user_can_create_a_robot
    visit "/robots/new"
    fill("name", "bob")
    fill("city", "denver")
    fill("state", "CO")
    fill("birth_date", "02/02/2001")
    fill("join_date", "05/21/2014")
    fill("favorite_color", "green")
    click_link_or_button('submit')
    visit "/robots"
    assert page.has_content?("bob")
  end

end
