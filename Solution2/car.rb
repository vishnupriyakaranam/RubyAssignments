class Car < Vehicle

  def Initialize
    super
    @Color = "Grey"
    @NumberOfWheels = 4
    @Size = "L"
  end

  def setColor()
    @Color = "Cyan"
  end
end