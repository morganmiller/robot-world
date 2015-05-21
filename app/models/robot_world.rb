require 'yaml/store'

class RobotWorld
  
  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total']  ||= 0
      database['total']  += 1
      database['robots'] << {
          "id"               => database['total'],
          "name"             => robot[:name],
          "city"             => robot[:city], 
          "state"            => robot[:state], 
          "birth_date"       => robot[:birth_date],
          "join_date"        => robot[:join_date],
          "favorite_color"   => robot[:favorite_color],
          "avatar"           => robot[:avatar]
      }
    end
  end
  
  def self.database
    @database ||= YAML::Store.new("db/robot_world")
  end
  
  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end
  
  def self.all
    raw_robots.map { |bot_data| Robot.new(bot_data) }
  end
  
  def self.raw_robot(id)
    raw_robots.find { |robot| robot["id"] == id }
  end
  
  def self.find(id)
    Robot.new(raw_robot(id))
  end
  
  def self.update(id, data)
    database.transaction do
      target_bot = database['robots'].find { |bot| bot["id"] == id }
      target_bot["name"]             = data[:name]
      target_bot["city"]             = data[:city]
      target_bot["state"]            = data[:state]
      target_bot["birth_date"]       = data[:birth_date]
      target_bot["join_date"]        = data[:join_date]
      target_bot["favorite_color"]   = data[:favorite_color]
      target_bot["avatar"]           = data[:avatar]
    end
  end
  
  def self.delete(id)
    database.transaction do
      database['robots'].delete_if { |bot| bot["id"] == id }
    end
  end
  
  def self.delete_all
    database.transaction do
      database['robots'] = []
      database['total'] = 0
    end
  end
end
