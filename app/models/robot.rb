class Robot
  
  attr_reader :id, :name, :city, :state, :birth_date,
              :join_date, :favorite_color, :avatar

  def initialize(data)
    @id             = data["id"]
    @name           = data["name"]
    @city           = data["city"]
    @state          = data["state"]
    @birth_date     = data["birth_date"]
    @join_date      = data["join_date"]
    @favorite_color = data["favorite_color"]
    @avatar         = "https://robohash.org/#{@name}.png"
  end

end
