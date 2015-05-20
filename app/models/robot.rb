class Robot
  
  attr_reader :id, :name, :city, :state, :birth_date,
              :hire_date, :department, :avatar

  def initialize(data)
    @id          = data["id"]
    @name        = data["name"]
    @city        = data["city"]
    @state       = data["state"]
    @birth_date  = data["birth_date"]
    @hire_date   = data["hire_date"]
    @department  = data["department"]
    @avatar      = data["avatar"]
  end

end
