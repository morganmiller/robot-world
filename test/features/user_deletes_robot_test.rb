require_relative '../test_helper'

class DeleteRobotTest < FeatureTest
  
  def test_user_can_delete_a_robot
    RobotWorld.create(    name: "bob",
                          city: "denver",
                          state: "CO",
                          birth_date: "02/02/2001",
                          join_date: "05/21/2014",
                          favorite_color: "green")
    
    visit '/robots'
    click_on "delete"
    
    refute page.has_content?("bob")
  end

end
