require 'date'

class Robot
  
  attr_reader :id, :name, :city, :state, :birth_date,
              :join_date, :favorite_color, :avatar

  def initialize(data)
    @id             = data[:id]
    @name           = data[:name]
    @city           = data[:city]
    @state          = data[:state]
    @birth_date     = data[:birth_date]
    @join_date      = data[:join_date]
    @favorite_color = data[:favorite_color]
    @avatar         = "https://robohash.org/#{@name}.png"
  end
  
  def birthday
    format = birth_date[6..9] + '-' + birth_date[0..1] + '-' + birth_date[3..4]
    Date.parse(format)
  end
  
  def sign
    date = birthday.strftime("%m%d").to_i
    if (321..419).to_a.include?(date)
      "Aries"
    elsif (420..520).to_a.include?(date)
      "Taurus"
    elsif (521..620).to_a.include?(date)
      "Gemini"
    elsif (621..722).to_a.include?(date)
      "Cancer"
    elsif (723..822).to_a.include?(date)
      "Leo"
    elsif (823..922).to_a.include?(date)
      "Virgo"
    elsif (923..1022).to_a.include?(date)
      "Libra"
    elsif (1023..1121).to_a.include?(date)
      "Scorpio"
    elsif (1122..1221).to_a.include?(date)
      "Sagittarius"
    elsif ((1222..1231).to_a + (101..119).to_a).include?(date)
      "Capricorn"
    elsif (120..218).to_a.include?(date)
      "Aquarius"
    elsif (219..320).to_a.include?(date)
      "Pisces"
    else
      "Invalid"
    end
  end

end
