require_relative '../test_helper'

class UpdateRobotTest < FeatureTest

  def fill(identifier, input)
    fill_in "robot[#{identifier}]", with: input
  end

  def test_user_can_update_a_robot
    RobotWorld.create(    name: "bob",
                          city: "denver",
                          state: "CO",
                          birth_date: "02/02/2001",
                          join_date: "05/21/2014",
                          favorite_color: "green")

    visit '/robots'
    click_on "Edit"

    fill("name", "jane")
    fill("city", "denver")
    fill("state", "CO")
    fill("birth_date", "04/04/2001")
    fill("join_date", "05/20/2014")
    fill("favorite_color", "blue")
    
    click_on "Update Info"
    
    refute page.has_content?("bob")
    assert page.has_content?("jane")
  end

end
