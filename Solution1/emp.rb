class Emp

  def initialize
    @id = 101
  end

  def getId
    @id
  end

  def setId(id)
    @id = id
  end
end

e = Emp.new
puts e.getId
e.setId(102)
puts e.getId
