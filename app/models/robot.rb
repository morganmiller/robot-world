class Robot
  
  attr_reader :id, :name, :city, :state, :birth_date,
              :likes, :dislikes, :avatar

  def initialize(data)
    @id          = data["id"]
    @name        = data["name"]
    @city        = data["city"]
    @state       = data["state"]
    @birth_date  = data["birth_date"]
    @likes       = data["likes"]
    @dislikes    = data["dislikes"]
    @avatar      = data["avatar"]
  end

end
