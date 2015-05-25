require 'yaml/store'

class RobotWorld
  def self.database
    if ENV["TASK_MANAGER_ENV"] == 'test'
      @database ||= Sequel.sqlite('db/robot_world_test.sqlite3')
    else
      @database ||= Sequel.sqlite('db/robot_world_dev.sqlite3')
    end
  end
  
  def self.dataset
    database.from(:robots)
  end
  
  def self.create(robot)
    dataset.insert( :name           => robot[:name],
                    :city           => robot[:city],
                    :state          => robot[:state],
                    :birth_date     => robot[:birth_date],
                    :join_date      => robot[:join_date],
                    :favorite_color => robot[:favorite_color],
                    :avatar         => robot[:avatar] )
  end
  
  def self.all
    dataset.map do |data|
      Robot.new(data)
    end
  end
  
  def self.find(id)
    robot = dataset.where(:id => id)
    Robot.new(robot.to_a[0])
  end
  
  def self.update(id, data)
    dataset.where(:id => id).update(data)
  end
  
  def self.delete(id)
    dataset.where(:id => id).delete
  end
  
  def self.delete_all
    dataset.delete
  end
end
