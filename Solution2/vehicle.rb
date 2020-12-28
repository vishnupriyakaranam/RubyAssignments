class Vehicle
  attr_accessor :NumberOfWheels
  attr_accessor :Color
  attr_accessor :Size

  def Initialize
    @NumberOfWheels = 4
    @Color = "White"
    @Size = "Small"
  end

  def setColor()
    @Color = "Orange"
  end

  def getColor
    @Color
  end
end