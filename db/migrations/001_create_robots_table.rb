require 'sequel'
require_relative '../../app/models/robot_world'

RobotWorld.database.create_table(:robots) do
  primary_key  :id
  String       :name
  String       :city
  String       :state
  String       :birth_date
  String       :join_date
  String       :favorite_color
  String       :avatar
end
