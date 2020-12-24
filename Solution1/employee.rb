class Employee

  attr_reader :empName
  attr_writer :empCity
  attr_accessor :empCompany

  def initialize
    @id = 101
    @empName = "ravi"
    @empCity = "Bangalore"
    @empCompany = "InTimeTec"
  end

  def getId
    @id
  end

  def setId(id)
    @id = id
  end

  def getCity
    @empCity
  end
end

e = Employee.new
puts e.getId
e.setId(102)
puts e.getId
e.empCompany = "Simplot"
puts "#{e.getId}  #{e.empName}  #{e.getCity}  #{e.empCompany}"